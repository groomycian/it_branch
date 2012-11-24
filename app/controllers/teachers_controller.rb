class TeachersController < ApplicationController
  def new
  	@teacher = Teacher.new
  end

  def show
  	@teacher = Teacher.find(params[:id])
  end

  def create
    @teacher = Teacher.new(params[:teacher])
    if @teacher.save
      sign_in @teacher
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @teacher
    else
      render 'new'
    end
  end
end
