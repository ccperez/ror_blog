# 6:27
class ProjectsController < ApplicationController
  before_action :get_project, except: [:index, :create]
  before_action :authenticate_user!, except: [:index, :show]

  def index
  	@projects = Project.order("created_at desc")
  end

  def show
    redirect_to @project, status: :moved_permanently if request.path != project_path(@project)    
  end

  def new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project, notice: "Nice Mackenzie! That project was successfully saved!"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Nice Mackenzie! That project was successfully updated!"
    else
      render 'edit'      
    end
  end

  def destroy
    @project.destroy
    redirect_to project_path
  end

  private 

  	def get_project()
  		@project = get_object(params[:id], Project)
  	end

    def project_params
      params.require(:project).permit(:title, :description, :link, :slug)
    end

end
