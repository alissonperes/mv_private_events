class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    unless @user.nil?
      redirect_to @user
    else
      flash[:danger] = 'Invalid email'
      redirect_to login_path
    end
  end
end
