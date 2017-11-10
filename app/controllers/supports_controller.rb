class SupportsController < ApplicationController
  before_action :set_support, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_freelance!, only: [:create]
  before_action :authenticate_client!, only: [:create_client]

  skip_before_action :verify_authenticity_token

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
      @support = Support.find_by(client_id:params[:client_id])

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

      if @support.freelance_id == nil
        @support.update(freelance_id: current_freelance.id)
      end

      newAddr = supports_path + '/' + @support.id.to_s
      redirect_to newAddr

  end

  #funcion para el cliente
    # llamada post
  def create_client
    @support = Support.find_by(client_id:current_client.id)

    if @support == nil
      @support = Support.new
      @support.client_id = current_client.id

      if @support.save
          newAddr = supports_path + '/' + @support.id.to_s

          redirect_to newAddr
      else
          render :file => 'public/500.html', status: :unprocessable_entity
      end
      return
    end

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
