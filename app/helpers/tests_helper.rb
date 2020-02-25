module TestsHelper
  def user_name(test)
    User.find(test.user_id).name
  end

  def questions_count(test)
    test.questions.size
  end
end
