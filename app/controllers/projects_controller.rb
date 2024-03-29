class ProjectsController < ApplicationController
  before_filter :authorize
  
  def index
    # TODO: Use kilometer or mile units depending on country
    @kpm = 1.609344 # Kilometers per mile
    @radius = Float(params[:radius] || 5.0) # Miles
    @projects = Project.connection.select_all <<-SQL
      select  p.id,
              p.summary, 
              (select count(*) from follows where project_id = p.id) follow_count, 
              u.latitude,
              u.longitude,
              u.dist
        from projects p
        inner join (
          select id,
                 latitude,
                 longitude,
                 acos(sin(latitude) * cos(#{current_user.latitude}) + 
                      cos(latitude) * cos(#{current_user.latitude}) *
                      cos(longitude - #{current_user.longitude})) * 
                      15.7 dist
          from users
        ) u on u.id = p.owner_id  
        where u.dist <= #{@radius * @kpm}
        order by u.dist
    SQL
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project])
    @project.owner = current_user
    if @project.save
      render 'show'
    else
      head :status => :unprocessable_entity
    end
  end

  def update
    @project = Project.find(params[:id])
    raise ApplicationController::AccessDenied \
      unless @project.owner == current_user

    if @project.update_attributes(params[:project])
      head :no_content
    else
      head :status => :unprocessable_entity
    end
  end

  def destroy
    @project = Project.find(params[:id])
    raise ApplicationController::AccessDenied \
      unless @project.owner == current_user

    @project.active = false
    @project.save!
    head :no_content
  end
end
