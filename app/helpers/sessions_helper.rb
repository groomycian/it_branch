module SessionsHelper

  def sign_in(teacher)
    cookies.permanent[:remember_token] = teacher.remember_token
    self.current_teacher = teacher
  end

  def signed_in?
    !self.current_teacher.nil?
  end

  def sign_out
    @current_teacher = nil
    cookies.delete(:remember_token)
  end

  def current_teacher=(teacher)
    @current_teacher = teacher
  end

  def current_teacher
    @current_teacher ||= Teacher.find_by_remember_token(cookies[:remember_token])
  end

  def current_teacher?(teacher)
    teacher == current_teacher
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end
end
