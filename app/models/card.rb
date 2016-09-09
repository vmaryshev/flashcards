class Card < ActiveRecord::Base
  validates :original_text, presence: true
  validates :translated_text, presence: true
  validates :review_date, presence: true
  validate :check_texts

  before_validation :set_review_date, on: :create

  def check_texts
    if original_text.mb_chars.downcase.strip == translated_text.mb_chars.downcase.strip
      errors.add(:original_text, "similar_of_texts")
      errors.add(:translated_text, "similar_of_texts")
    end
  end

  def set_review_date
    self.review_date = 3.days.since
  end
end
