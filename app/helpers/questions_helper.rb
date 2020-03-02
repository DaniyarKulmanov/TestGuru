module QuestionsHelper
  def question_header(question) #TODO undefined method `new_record?' for nil:NilClass
    if question.new_record?
      "New #{question.test.title} question"
    else
      "Edit #{question.test.title} question"
    end
  end
end
