module AnswersHelper
  def answer_header
    "#{params[:action].capitalize} answer"
  end
end
