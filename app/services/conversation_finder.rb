require "digest"
# app/services/conversation_finder.rb
class ConversationFinder
  COOKIE_KEY = :luvnote_support_visitor_id

  def self.find_or_create!(cookies:, request:)
    visitor_id = cookies[COOKIE_KEY]

    if visitor_id.blank?
      visitor_id = SecureRandom.uuid
      cookies.permanent[COOKIE_KEY] = visitor_id
    end

    conv = Conversation.find_by(visitor_id: visitor_id)
    return touch!(conv) if conv

    Conversation.create!(
      visitor_id: visitor_id,
      started_at: Time.current,
      last_activity_at: Time.current,
      user_agent: request.user_agent.to_s,
      ip_hash: ip_hash(request)
    )
  end

  def self.touch!(conversation)
    conversation.update!(last_activity_at: Time.current)
    conversation
  end

  def self.ip_hash(request)
    ip = request.remote_ip.to_s
    return nil if ip.blank?
    Digest::SHA256.hexdigest(ip)
  end
end
