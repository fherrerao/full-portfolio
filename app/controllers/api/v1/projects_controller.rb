class Api::V1::ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  protect_from_forgery with: :null_session

  # GET /projects or /projects.json
  def index
    @projects = Project.all
    render json: @projects
  end

  # GET /projects/1 or /projects/1.json
  def show
    render json: @project
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)    
    if @project.save        
      render json: { message: "Project was succesfully created!" }, status: :created
    else
      render json: { message: "Project can't be created!" }, status: :unprocessable_entity      
    end    
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    if @project.update(project_params)        
      render json: { message: "Project was successfully updated." },  status: :ok
    else        
      render json: { message: "Project was successfully updated." },  status: :unprocessable_entity
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    if @project.destroy       
      render json: { message: "Project was successfully destroyed."}
    else
      render json: { message: "Project can`t be destroyed." }
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:title, :description, :tech_1, :tech_2, :tech_3)
    end
end
