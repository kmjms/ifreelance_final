class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_freelance!
  layout 'dashboard'
  
  # GET /items
  # GET /items.json
  def index

  
    #if params[:project_id] == nil
      @project = Project.find(params[:project_id])
      @items = @project.items.all
      @items = @project.items.all
     #   else
      #    flash[:notice] = "Proyecto no contiene items"
       #    redirect_to projects_path
    # end
    
  end

  # GET /items/1
  # GET /items/1.json
  def show
    
  end

  # GET /items/new
  def new
    flash[:notice] = "Item creado"
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Project.find(params[:project_id]).items.new(item_params)

    respond_to do |format|
      net_address = projects_path + '/' +  @item.project_id.to_s + items_path

      if @item.save
        
        format.html { redirect_to net_address , notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    net_address = projects_path + '/' +  @item.project_id.to_s + items_path
    respond_to do |format|
      format.html { redirect_to net_address, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.permit(:description, :price, :project_id)
    end
end
