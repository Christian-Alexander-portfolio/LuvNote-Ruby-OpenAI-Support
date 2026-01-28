# app/services/openai_support_router.rb
require "openai"
require "json"

class OpenaiSupportRouter
  Result = Struct.new(:support_page, :confidence, :answer, :reason, keyword_init: true)

  def initialize(model: default_model)
    @model = model
    @client = OpenAI::Client.new(access_token: api_key)
  end

  # pages: Array<SupportPage>
  def route(question:, pages:)
    raise ArgumentError, "pages required" if pages.nil? || pages.empty?

    pages_payload = pages.map do |p|
      {
        slug: p.slug,
        title: p.title,
        summary: p.summary.to_s,
        tags: p.tags.to_s
      }
    end

    system_prompt = <<~SYS
      You are an AI support assistant for LuvNote (app.luvnotedating.com).
      Choose the single best matching support page from the provided list and write a helpful answer.

      Return STRICT JSON ONLY (no markdown, no extra text).
      Use only the provided pages; do not invent features.
      confidence must be a number from 0.0 to 1.0.

      JSON schema:
      {
        "support_page_slug": "string",
        "confidence": 0.0,
        "answer": "string",
        "reason": "short string"
      }
    SYS

    user_payload = { question: question, support_pages: pages_payload }.to_json

    resp = @client.chat(
      parameters: {
        model: @model,
        temperature: default_temperature,
        max_tokens: default_max_tokens,
        messages: [
          { role: "system", content: system_prompt },
          { role: "user", content: user_payload }
        ]
      }
    )

    content = resp.dig("choices", 0, "message", "content").to_s.strip
    parsed = JSON.parse(content)

    slug = parsed["support_page_slug"].to_s.strip
    confidence = parsed["confidence"].to_f
    answer = parsed["answer"].to_s.strip
    reason = parsed["reason"].to_s.strip

    confidence = 0.0 if confidence.nan?
    confidence = [[confidence, 0.0].max, 1.0].min

    page = pages.find { |p| p.slug == slug } || SupportPage.find_by(slug: slug)

    Result.new(
      support_page: page,
      confidence: confidence,
      answer: answer,
      reason: reason
    )
  rescue JSON::ParserError
    Result.new(support_page: nil, confidence: 0.0, answer: "", reason: "invalid_json")
  rescue StandardError => e
    Result.new(support_page: nil, confidence: 0.0, answer: "", reason: "error: #{e.class}")
  end

  private

  def api_key
    # Supports either hardcoded initializer constants OR env vars
    if defined?(OPENAI_API_KEY) && OPENAI_API_KEY.to_s.strip != ""
      OPENAI_API_KEY
    else
      ENV.fetch("OPENAI_API_KEY")
    end
  end

  def default_model
    if defined?(OPENAI_MODEL) && OPENAI_MODEL.to_s.strip != ""
      OPENAI_MODEL
    else
      ENV.fetch("OPENAI_MODEL", "gpt-4o-mini")
    end
  end

  def default_max_tokens
    if defined?(OPENAI_MAX_TOKENS) && OPENAI_MAX_TOKENS.to_i > 0
      OPENAI_MAX_TOKENS.to_i
    else
      (ENV["OPENAI_MAX_TOKENS"] || "500").to_i
    end
  end

  def default_temperature
    if defined?(OPENAI_TEMPERATURE)
      OPENAI_TEMPERATURE.to_f
    else
      (ENV["OPENAI_TEMPERATURE"] || "0.7").to_f
    end
  end
end
