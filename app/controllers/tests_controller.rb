class TestsController < ApplicationController
  before_action :find_test, only: [:show, :edit, :create, :update]

  def index
    @tests = Test.all
  end

  def show
  end
  
  def new
    @test = Test.new
  end

  def edit
  end

  def create
    if @test.save
      redirect_to @test
    else
      render 'new'
    end
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render 'edit'
    end
  end

  def destroy
    
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :user_id, :category_id)
  end

  def find_test
    @test = Test.new(test_params)
  end
end
