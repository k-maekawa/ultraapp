class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path, notice: "ログイン完了"
    else
      flash.now[:alert] = "nameもしくはpasswordが異なります"
      render :show
  end

  def destroy
  end
end
