class SupportPage < ApplicationRecord
  has_many :messages, foreign_key: :chosen_support_page_id

  validates :slug, presence: true, uniqueness: true
  validates :title, presence: true
end
