class User < ApplicationRecord
  JOIN_CERTIFICATION = 'INNER JOIN certifications ON certifications.test_id = tests.id'.freeze

  def test_by_level (level)
    Test
      .joins(JOIN_CERTIFICATION)
      .where level: level, 'certifications.user_id' => self.id
  end
end
