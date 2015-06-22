class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = 'Olá #{@user.name}, você está logado com sucesso'
      redirect_to login_path
    else
      flash.now[:danger] = 'E-mail ou senha inválidos!'
      render 'new'
    end

  end
end
