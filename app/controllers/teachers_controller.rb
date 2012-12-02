class TeachersController < ApplicationController
  before_filter :signed_in_teacher, only: [:index, :edit, :update]
  before_filter :correct_teacher,   only: [:edit, :update]
  before_filter :admin_teacher,     only: :destroy

  def index
    @teachers = Teacher.paginate(page: params[:page])
  end

  def new
  	@teacher = Teacher.new
  end

  def show
  	@teacher = Teacher.find(params[:id])
  end

  def edit
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

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update_attributes(params[:teacher])
      flash[:success] = "Профиль изменён"
      sign_in @teacher
      redirect_to @teacher
    else
      render 'edit'
    end
  end

  def destroy
    Teacher.find(params[:id]).destroy
    flash[:success] = "Преподаватель удалён."
    redirect_to teachers_url
  end

  private

  def signed_in_teacher
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Пожалуйста авторизуйтесь."
    end
  end

  def correct_teacher
    @teacher = Teacher.find(params[:id])
    redirect_to(root_path) unless current_teacher?(@teacher)
  end

  def admin_teacher
      redirect_to(root_path) unless current_teacher.admin?
    end
end
