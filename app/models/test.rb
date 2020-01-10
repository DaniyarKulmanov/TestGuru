class Test < ApplicationRecord

  has_many :questions
  has_many :certifications
  has_many :users, through: :certifications
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :user_id

  JOIN_CATEGORY = 'INNER JOIN categories ON categories.id = tests.category_id'.freeze

  def self.test_by_category (category)
    Test
      .select(:title)
      .joins(JOIN_CATEGORY)
      .order(title: :desc)
      .where(categories: { title: category })
  end
end
