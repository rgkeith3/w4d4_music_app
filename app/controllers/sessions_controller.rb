class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @user
      login
      render json: params
      #redirect_to music_url
    else
      flash[:errors] = ["Username and Password don't match"]
      render :new
    end
  end

  def destroy
  end

  private


end
