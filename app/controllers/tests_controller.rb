class TestsController < ApplicationController

  def index
    
  end

  def show
    @test = Test.find(params[:id])
  end
  
  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    @test.save
    redirect_to @test
  end

  private
  def test_params
    params.require(:test).permit(:title, :level, :user_id, :category_id)
  end
end
