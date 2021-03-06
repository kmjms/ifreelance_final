class ClientsController < ApplicationController
  before_action :set_client, only: [:details]
  before_action :authenticate_freelance!, only: [:index,:create]
  before_action :authenticate_client!, only: [:client_view,:client_projects]

  skip_before_action :verify_authenticity_token
  # GET /clients
  # GET /clients.json
  layout 'dashboard'


  
  def index
    
    @freelance = current_freelance
    @clients = current_freelance.clients.all
  end

  # GET /clients/1
  # GET /clients/1.json

  # GET /clients/new
  def new
    flash[:notice] = "Cliente creado"
    @client = Client.new
  end

  def details
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    #newParams = client_params.as_json
    flash[:notice] = "Cliente creado"
    @client = current_freelance.clients.create(client_params)

    #@client = current_freelance.clients
    #@client.name = params[:name]
    #@client.surname = params[:surname]
    #@client.username = params[:username]
    #@client.password = params[:password]

    respond_to do |format|
      if @client.save
        format.html { redirect_to clients_path, notice: 'Client was successfully created.' }
        #format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|

      if @client.update(client_params)
        format.html { redirect_to clients_path, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def client_view
      @client = current_client
      @freelances = current_client.freelances
      @supports = Support.where(client_id:current_client.id)
  end
  
  def client_projects
      @projects = Project.find_by(client_id:current_client.id)
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
        @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.permit(:name,:surname,:email,:username,:password)
    end
end