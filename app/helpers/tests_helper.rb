module TestsHelper
  def user_name(test)
    User.find(test.user_id).name
  end
end
