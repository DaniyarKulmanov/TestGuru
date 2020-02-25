module QuestionsHelper
  def question_header(test)
    "#{params[:action].capitalize} #{test.title} question"
  end
end
