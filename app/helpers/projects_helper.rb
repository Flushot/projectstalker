module ProjectsHelper
  def get_project(project_hash)
    Project.find(project_hash['id'])
  end
end
