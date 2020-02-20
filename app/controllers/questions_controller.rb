class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :show, :destroy, :create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render  plain: @test.questions.each{ |question| question }
  end

  def show
    body = @test.questions.find(params[:id]).body
  end

  def new
  end

  def create
    question = @test.questions.new(question_params)
    question.save ? rendering(question.inspect) : rendering('Question not saved')
  end

  def destroy
    @question = @test.questions.find(params[:id])
    @question.destroy

    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'No question found'
  end

  def rendering(content)
    render plain: content
  end
end
