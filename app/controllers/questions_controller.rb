class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :edit, :update]
  # before_action :find_test, only: [:new, :create,]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index; end

  def show;  end

  def new;
    @question = Question.new
    find_test
  end

  def edit; end

  def create
    find_test
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to test_path(@test)
    else
      render 'new'
    end
  end

  def update
    if @question.update(question_params)
      redirect_to test_path(@test)
    else
      render 'edit'
    end
  end

  def destroy
    find_test
    @question.destroy
    byebug
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

  def find_question
    @question = Question.find(params[:id])
  end
end
