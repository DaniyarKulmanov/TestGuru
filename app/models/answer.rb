class Answer < ApplicationRecord
  belongs_to :question
  scope :correct, -> { where(correct: true) }

  validate :validate_answers, unless: :question_nil?

  private

  def validate_answers
    errors.add(:answers, 'only 1 - 4 answers allowed') unless (1..3).include? self.question.answers.size
  end

  def question_nil?
    self.question.nil?
  end
end
