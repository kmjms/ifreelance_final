class TypeProjectsController < ApplicationController
  before_action :set_type_project, only: [:show, :edit, :update, :destroy]

  # GET /type_projects
  # GET /type_projects.json
  def index
    @type_projects = TypeProject.all
  end

  # GET /type_projects/1
  # GET /type_projects/1.json
  def show
  end

  # GET /type_projects/new
  def new
    @type_project = TypeProject.new
  end

  # GET /type_projects/1/edit
  def edit
  end

  # POST /type_projects
  # POST /type_projects.json
  def create
    @type_project = TypeProject.new(type_project_params)

    respond_to do |format|
      if @type_project.save
        format.html { redirect_to @type_project, notice: 'Type project was successfully created.' }
        format.json { render :show, status: :created, location: @type_project }
      else
        format.html { render :new }
        format.json { render json: @type_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_projects/1
  # PATCH/PUT /type_projects/1.json
  def update
    respond_to do |format|
      if @type_project.update(type_project_params)
        format.html { redirect_to @type_project, notice: 'Type project was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_project }
      else
        format.html { render :edit }
        format.json { render json: @type_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_projects/1
  # DELETE /type_projects/1.json
  def destroy
    @type_project.destroy
    respond_to do |format|
      format.html { redirect_to type_projects_url, notice: 'Type project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_project
      @type_project = TypeProject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_project_params
      params.require(:type_project).permit(:name, :description)
    end
end
