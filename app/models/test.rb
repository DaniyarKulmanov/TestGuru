class Test < ApplicationRecord

  INFINITY = Float::INFINITY
  JOIN_CATEGORY = 'INNER JOIN categories ON categories.id = tests.category_id'.freeze

  has_many :questions
  has_many :certifications
  has_many :users, through: :certifications
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :user_id

  scope :intermediate, -> { where level: 0..1 }
  scope :advanced, -> { where level: 2..4 }
  scope :pro, -> { where level: 5..INFINITY }
  scope :test_by_category, -> (category) {
    select(:title).joins(JOIN_CATEGORY).order(title: :desc).where(categories: {title: category})
  }

  validates :title, presence: true
  validates :level, numericality: { only_integer: true }
  validates :category_id, presence: true
  validates :user_id, presence: true
end
