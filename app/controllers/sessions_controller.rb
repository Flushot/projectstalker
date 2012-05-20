class SessionsController < ApplicationController
  respond_to :json, :html
  layout nil
  
  skip_before_filter :authorize

  def show
    @user = current_user || {}
    respond_to do |format|
      format.json
    end
  end

  def create
    @user = User.authenticate(params[:email], params[:password])
    respond_to do |format|
      format.json do
        if @user
          session[:user_id] = @user.id
          render 'show'
        else
          head :status => :unauthorized
        end
      end
    end
  end

  def destroy
    session[:user_id] = nil
    head :status => :ok
  end
end
