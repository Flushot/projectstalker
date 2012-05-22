class CommentsController < ApplicationController
  before_filter :get_project

  def index
    @comments = Comment.where(:project_id => @project).order('updated_at DESC')
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.project = @project
    @comment.user = current_user
    if @comment.save
      render 'show'
    else
      head :status => :unprocessable_entity
    end
  end

  def update
    @comment = Comment.find(params[:id])
    raise ApplicationController::AccessDenied \
      unless @comment.user == current_user

    if @comment.update_attributes(params[:comment])
      head :no_content
    else
      head :status => :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    raise ApplicationController::AccessDenied \
      unless @comment.user == current_user

    @comment.destroy
    head :no_content
  end

private
  def get_project
    @project = Project.find(params[:project_id])
  end
end
