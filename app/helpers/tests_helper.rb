module TestsHelper
  def user_name(test)
    User.find(test.user_id).name
  end

  def questions_count(test)
    test.questions.size
  end

  def question_set
    if params[:action] == 'new'
      @test.questions.build
    else
      @question
    end
  end
end
