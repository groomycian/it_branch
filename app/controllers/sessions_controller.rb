class SessionsController < ApplicationController
  
  def new
  
  end

  def create
    teacher = Teacher.find_by_email(params[:session][:email].downcase)
    if teacher && teacher.authenticate(params[:session][:password])
      sign_in teacher
      redirect_back_or teacher
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def delete
  
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
