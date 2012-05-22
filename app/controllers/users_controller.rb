class UsersController < ApplicationController
  before_filter :authorize, :only => [:show, :update]

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      render 'show'
    else
      head :status => :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    raise ApplicationController::AccessDenied \
      unless @user == current_user

    if @user.update_attributes(params[:user])
      head :no_content
    else
      head :status => :unprocessable_entity
    end
  end
end
