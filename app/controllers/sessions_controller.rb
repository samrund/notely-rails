class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by username: login_params[:username]
    if user.present? && user.authenticate(login_params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: t('session.flash.create.success')
    else
      @user = User.new username: login_params[:username]
      flash.now.alert = t('session.flash.create.failure')
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: t('session.flash.destroy.success')
  end

  private

  def login_params
    params.require(:user).permit(:username, :password)
  end
end
