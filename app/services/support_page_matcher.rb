# app/services/support_page_matcher.rb
class SupportPageMatcher
  Result = Struct.new(:page, :confidence, :best_score, :second_score, keyword_init: true)

  # Basic English stopwords (keep small; tweak anytime)
  STOPWORDS = %w[
    the a an and or but if then else for to of in on at by with from
    i me my you your yours we our ours they them their theirs
    is are was were be been being do does did can could should would
    what how why where when which help please
  ].to_set

  # Weights: tune these later
  WEIGHTS = {
    slug: 5,
    title: 4,
    tags: 6,
    summary: 2,
    body: 1
  }.freeze

  def self.match(query, pages: SupportPage.all)
    q = normalize(query)
    keywords = extract_keywords(q)

    return Result.new(page: nil, confidence: 0.0, best_score: 0.0, second_score: 0.0) if keywords.empty?

    scored = pages.map do |page|
      score = score_page(page, keywords)
      [page, score]
    end.sort_by { |(_, score)| -score }

    best_page, best_score = scored[0]
    _, second_score = scored[1] || [nil, 0.0]

    confidence = confidence_from(best_score, second_score)

    Result.new(
      page: best_page,
      confidence: confidence,
      best_score: best_score,
      second_score: second_score
    )
  end

  # -----------------------
  # Scoring
  # -----------------------
  def self.score_page(page, keywords)
    slug_tokens    = tokenize(page.slug.to_s)
    title_tokens   = tokenize(page.title.to_s)
    tags_tokens    = tokenize(page.tags.to_s.gsub(",", " "))
    summary_tokens = tokenize(page.summary.to_s)
    body_tokens    = tokenize(page.body_md.to_s)

    score = 0.0
    score += WEIGHTS[:slug]    * overlap_ratio(keywords, slug_tokens)
    score += WEIGHTS[:title]   * overlap_ratio(keywords, title_tokens)
    score += WEIGHTS[:tags]    * overlap_ratio(keywords, tags_tokens)
    score += WEIGHTS[:summary] * overlap_ratio(keywords, summary_tokens)
    score += WEIGHTS[:body]    * overlap_ratio(keywords, body_tokens)

    # Small bonus for exact phrase hit in title/slug
    q_phrase = keywords.join(" ")
    score += 0.5 if page.title.to_s.downcase.include?(q_phrase)
    score += 0.5 if page.slug.to_s.downcase.include?(q_phrase)

    score
  end

  def self.overlap_ratio(keywords, tokens)
    return 0.0 if keywords.empty? || tokens.empty?
    hits = keywords.count { |k| tokens.include?(k) }
    hits.to_f / keywords.length
  end

  # Convert raw scores into 0..1 confidence
  def self.confidence_from(best_score, second_score)
    # Approx max score is sum(weights) * 1.0 + small bonuses
    approx_max = WEIGHTS.values.sum.to_f + 1.0
    base = best_score / approx_max

    # Margin boosts confidence when best is clearly better than second
    margin = best_score - second_score
    margin_bonus =
      if margin >= 2.5 then 0.15
      elsif margin >= 1.5 then 0.10
      elsif margin >= 0.75 then 0.05
      else 0.0
      end

    conf = base + margin_bonus
    conf = 0.0 if conf.nan?
    [[conf, 0.0].max, 1.0].min
  end

  # -----------------------
  # Text helpers
  # -----------------------
  def self.normalize(text)
    text.to_s.downcase.strip
  end

  def self.tokenize(text)
    normalize(text)
      .gsub(/[^a-z0-9\s]/, " ")
      .split(/\s+/)
      .reject { |t| t.length < 2 }
      .uniq
  end

  def self.extract_keywords(text)
    tokenize(text).reject { |t| STOPWORDS.include?(t) }
  end
end
