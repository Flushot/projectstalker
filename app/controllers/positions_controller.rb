class PositionsController < ApplicationController
  #before_filter :authorize

  def create
    @user = User.find(2)
    #@user = current_user

    @user.latitude = params[:latitude]
    @user.longitude = params[:longitude]
    #@user.last_position_at = Date.new # Timezone displacement out of range error thrown

    respond_to do |format|
      if @user.save
        format.json { head :status => :created }
      else
        format.json { head :status => :unprocessable_entity }
      end
    end
  end
end
