class CommentsController < ApplicationController
  before_filter :get_project
  respond_to :json

  def index
    @comments = Comment.where(:project_id => @project).order('updated_at DESC')
    respond_with(@comments)
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
    if @comment.user == current_user
      # User owns comment
      if @comment.update_attributes(params[:comment])
        head :no_content
      else
        head :status => :unprocessable_entity
      end
    else
      head :status => :forbidden
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      # User owns comment
      @comment.destroy
      head :no_content
    else
      head :status => :forbidden
    end
  end

private
  def get_project
    @project = Project.find(params[:project_id])
  end
end
