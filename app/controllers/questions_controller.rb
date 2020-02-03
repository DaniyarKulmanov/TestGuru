class QuestionsController < ApplicationController
  before_action :search_test, only: :show

  def index
    render  plain: 'hello'
  end

  def show
    
  end

  def new
    
  end

  def create
    
  end

  def destroy
    
  end

  private

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def search_test
    
  end
end
