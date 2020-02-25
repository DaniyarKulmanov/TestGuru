class QuestionsController < ApplicationController
  before_action :find_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render  plain: @test.questions.each{ |question| question }
  end

  def show
    @question = @test.questions.find(params[:id])
  end

  def new
  end

  def edit
    @question = @test.questions.find(params[:id])
  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      redirect_to test_path(@test)
    else
      render 'new'
    end
  end

  def update
    @question = @test.questions.find(params[:id])

    if @question.update(question_params)
      redirect_to test_question_path(@test, @question)
    else
      render 'edit'
    end
  end

  def destroy
    @question = @test.questions.find(params[:id])
    @question.destroy

    redirect_to test_path(@test)
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
