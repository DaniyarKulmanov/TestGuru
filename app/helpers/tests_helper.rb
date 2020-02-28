module TestsHelper
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
