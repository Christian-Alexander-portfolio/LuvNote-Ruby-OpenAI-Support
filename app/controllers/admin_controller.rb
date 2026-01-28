class AdminController < ApplicationController
  def index
  end

  def dashboard
    @conversations = Conversation.joins(:messages).distinct.order(last_activity_at: :desc).limit(50)
    @total_conversations = Conversation.count
    @total_messages = Message.count
    @conversations_today = Conversation.where("created_at >= ?", Time.current.beginning_of_day).count
    @messages_today = Message.where("created_at >= ?", Time.current.beginning_of_day).count
  end

  def conversation
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages.order(:created_at)
  end

  def conversations
  end
end
