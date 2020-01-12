class Question < ApplicationRecord
  has_many :answers
  belongs_to :test

  validates :body, presence: true
  validate :validate_answers
  
  private

  def validate_answers
    errors.add(:answers, 'invalid scope') unless (1..4).include? self.answers.size
  end
end
