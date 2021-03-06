class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params
    if @project.save
      redirect_to action: 'index', controller: 'projects'
    else
      render 'new'
    end
  end

  private
  def project_params
    params.require(:project).permit(:name)
  end
end
