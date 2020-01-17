class User < ApplicationRecord
  JOIN_CERTIFICATION = 'INNER JOIN certifications ON certifications.test_id = tests.id'.freeze

  has_many :certifications
  has_many :tests, through: :certifications
  has_many :created_tests, class_name: 'Test'

  validates :name, presence: true
  validates :email,presence: true

  def test_by_level (level)
    Test
      .joins(JOIN_CERTIFICATION)
      .where(level: level, certifications: { user_id: id })
  end
end
