class User < ApplicationRecord
  def test_by_level (level)
    Test.where level: level, user_id: self.id
  end
end
