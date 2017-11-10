class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_freelance!
  
  # GET /expenses
  # GET /expenses.json
  def index

  
    #if params[:project_id] == nil
      @project = Project.find(params[:project_id])
      @expenses = @project.expenses.all
     #   else
      #    flash[:notice] = "Proyecto no contiene expenses"
       #    redirect_to projects_path
    # end
    
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
    
  end

  # GET /expenses/new
  def new
    @expense = Item.new
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = Project.find(params[:project_id]).expenses.new(item_params)

    respond_to do |format|
      net_address = projects_path + '/' +  @expense.project_id.to_s + expenses_path

      if @expense.save
        
        format.html { redirect_to net_address , notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    respond_to do |format|
      if @expense.update(item_params)
        format.html { redirect_to @expense, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    net_address = projects_path + '/' +  @expense.project_id.to_s + expenses_path
    respond_to do |format|
      format.html { redirect_to net_address, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @expense = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.permit(:description, :price, :project_id)
    end
end
