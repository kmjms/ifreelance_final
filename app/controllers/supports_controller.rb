class SupportsController < ApplicationController
  before_action :set_support, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_freelance!, only: [:create]
  before_action :authenticate_client!, only: [:create_client]

  skip_before_action :verify_authenticity_token
  layout 'dashboard'

  # GET /supports
  # GET /supports.json
  def index
    @supports = Support.all
  end

  # GET /supports/1
  # GET /supports/1.json
  def show
    if freelance_signed_in?
      puts 'freelance'
      @chat_usr_name = current_freelance.username
      @chat_usr_type = true
    else 
      if client_signed_in?
        @client = current_client
        @chat_usr_name = current_client.username
        @chat_usr_type = false
        else
          render :file => 'public/401.html', status: 401
      end
    end
  end

  # GET /supports/new
  def new
    @support = Support.new
  end

  # GET /supports/1/edit
  def edit
  end

  # POST /supports
  # POST /supports.json
  def create
      @support = Support.where("client_id=" + params[:client_id] + " and freelance_id=" + current_freelance.id.to_s).limit(1).take!
      
      puts 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXxxx'
      puts @support
      puts 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXxxx'

      if @support == nil
        @support = Support.new
        @support.client_id = params[:client_id]
        @support.freelance_id = current_freelance.id
        
        if @support.save
            newAddr = supports_path + '/' + @support.id.to_s

            redirect_to newAddr
        else
            render :file => 'public/500.html', status: :unprocessable_entity
        end
        return
      end

      

      @sender_type=1
      newAddr = supports_path + '/' + @support.id.to_s
      redirect_to newAddr
  end


  def create_client
    
    @support = Support.where("client_id=" + current_client.id.to_s + " and freelance_id=" + params[:freelance_id]).limit(1).take! rescue nil
  
    if @support == nil
      @support = Support.new
      @support.client_id = current_client.id
      @support.freelance_id = params[:freelance_id]
      
      if @support.save
          newAddr = supports_path + '/' + @support.id.to_s

          redirect_to newAddr
      else
          render :file => 'public/500.html', status: :unprocessable_entity
      end
      return
    end

    @sender_type=0
    newAddr = supports_path + '/' + @support.id.to_s
    redirect_to newAddr
  end




  # PATCH/PUT /supports/1
  # PATCH/PUT /supports/1.json
  def update
    respond_to do |format|
      if @support.update(support_params)
        format.html { redirect_to @support, notice: 'Support was successfully updated.' }
        format.json { render :show, status: :ok, location: @support }
      else
        format.html { render :edit }
        format.json { render json: @support.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supports/1
  # DELETE /supports/1.json
  def destroy
    @support.destroy
    respond_to do |format|
      format.html { redirect_to supports_url, notice: 'Support was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_support
      @support = Support.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def support_params
      #params.fetch(:support, {})
    end
end
