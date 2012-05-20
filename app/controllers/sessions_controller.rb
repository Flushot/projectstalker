class SessionsController < ApplicationController
  before_filter :authorize, :only => [:show, :destroy]

  def show
    @user = current_user
  end

  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      render 'show'
    else
      head :status => :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    head :status => :ok
  end
end
