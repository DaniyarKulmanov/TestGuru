module QuestionsHelper
  def question_header
    "#{params[:action].capitalize} question"
  end

  def answer_set #TODO rename to answer_action
    if params[:action] == 'new'
      @question.answers.build
    else
      @answer
    end
  end
end
