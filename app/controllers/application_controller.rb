class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def log_in user
    session[:user_id] = user.id
    remember user
    flash[:success] = 'Olá #{user.name}, você está logado com sucesso'
  end

  def remember user
    cookies.permanent[:remember_token] = user.create_remember_token
    user.save
    cookies.permanent.signed[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find session[:user_id] if session[:user_id]
  rescue ActiveRecord::RecordNotFound
      session.delete(:user_id)
      nil
  end

end
