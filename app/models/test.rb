class Test < ApplicationRecord

  JOIN_CATEGORY = 'INNER JOIN categories ON categories.id = tests.category_id'.freeze

  has_many :questions
  has_many :certifications
  has_many :users, through: :certifications
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :user_id

  scope :intermediate, -> { where level: 0..1 }
  scope :advanced, -> { where level: 2..4 }
  scope :pro, -> { where level: 5..Float::INFINITY }
  scope :by_field, -> (attribute) { select(attribute.to_sym) }

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  #TODO
  validates :title, :level, uniqueness: { scope: [:title, :level] }

  def self.test_by_category (category)
    Test
         joins(JOIN_CATEGORY)
        .order(title: :desc)
        .where(categories: { title: category })
  end
end
