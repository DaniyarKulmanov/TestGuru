class QuestionsController < ApplicationController
  before_action :search_test, only: [:index, :show, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render  plain: @test.questions.each{ |question| question }
  end

  def show
    body = @test.questions.find(params[:id]).body
    render plain: body
  end

  def new
    # @questoin = Question.new
  end

  def create
    question = Question.create(question_params)
    render plain: question.inspect
  end

  def destroy
    @question = @test.questions.find(params[:id])
    @question.destroy

    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def search_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'No question found'
  end
end
