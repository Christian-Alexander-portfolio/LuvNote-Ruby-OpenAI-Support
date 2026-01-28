class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :chosen_support_page, class_name: "SupportPage", optional: true

  validates :role, inclusion: { in: %w[user assistant system] }
end
