class PositionsController < ApplicationController
  before_filter :authorize

  def create
    @user = current_user
    @user.latitude = params[:latitude]
    @user.longitude = params[:longitude]
    #@user.last_position_at = Date.new # Timezone displacement out of range error thrown

    if @user.save
      head :status => :created
    else
      head :status => :unprocessable_entity
    end
  end
end
