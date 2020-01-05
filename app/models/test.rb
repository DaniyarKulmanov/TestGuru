class Test < ApplicationRecord
  JOIN_CATEGORY = 'INNER JOIN categories ON categories.id = tests.category_id'.freeze

  def self.test_by_category (category)
    Test
      .select(:title)
      .joins(JOIN_CATEGORY)
      .order(title: :desc)
      .where('categories.title' => category)
  end
end
