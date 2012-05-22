class FollowsController < ApplicationController
  before_filter :get_project

  def create
    @follow = Follow.new
    @follow.project = @project
    @follow.user = current_user
    if @follow.save
      head :no_content
    else
      head :status => :unprocessable_entity
    end
  end

  def destroy
    @follow = Follow.find(params[:id])
    raise ApplicationController::AccessDenied \
      unless @follow.user == current_user

    @follow.destroy
    head :no_content
  end

private
  def get_project
    @project = Project.find(params[:project_id])
  end
end
