module TestsHelper
  def user_name(id)
    User.find(id).name
  end
end
