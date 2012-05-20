class UsersController < ApplicationController
  #before_filter :authorize

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.json { render 'show' }
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.json { render 'show' }
      else
        format.json { head :status => :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.json { head :no_content }
      else
        format.json { head :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end
end
