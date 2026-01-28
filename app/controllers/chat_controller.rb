class ChatController < ApplicationController
  def index
    @conversation = ConversationFinder.find_or_create!(cookies: cookies, request: request)
    messages = @conversation.messages.order(:created_at)
    if @conversation.cleared_at.present?
      messages = messages.where("created_at > ?", @conversation.cleared_at)
    end
    @messages = messages
  end

  def clear
    @conversation = ConversationFinder.find_or_create!(cookies: cookies, request: request)
    @conversation.update!(cleared_at: Time.current)
    redirect_to root_path
  end

  def create
    @conversation = ConversationFinder.find_or_create!(cookies: cookies, request: request)

    user_text = params[:content].to_s.strip
    redirect_to root_path and return if user_text.blank?

    @conversation.messages.create!(role: "user", content: user_text)

    pages = SupportPage.order(:slug).to_a

    router = OpenaiSupportRouter.new
    result = router.route(question: user_text, pages: pages)

    confidence = result.confidence
    chosen_page = result.support_page

    if confidence < 0.50 || chosen_page.nil?
      assistant_text = "I'm sorry I did not understand your question"
      link_type = "none"
      link_url  = nil
    elsif confidence < 0.80
      assistant_text = result.answer.presence || "This support page should help: #{chosen_page.title}"
      link_type = "support"
      link_url  = support_page_path(chosen_page.slug)
    else
      assistant_text = result.answer.presence || "Here’s how to do that: #{chosen_page.title}"
      link_type = "in_app"
      link_url  = chosen_page.in_app_url
    end

    @conversation.messages.create!(
      role: "assistant",
      content: assistant_text,
      confidence: confidence,
      chosen_support_page: chosen_page,
      link_type: link_type,
      link_url: link_url,
      model: ENV.fetch("OPENAI_MODEL", "gpt-4o-mini")
    )

    redirect_to root_path
  end
end