class TransfersController < ApplicationController
  before_action :set_transfer, only: [:show, :edit, :update, :destroy, :index, :new, :create], except: [:alltransfers]

  # GET /transfers
  # GET /transfers.json
  def index
    @transfers = @elemento.transfers.all
  end

  # GET /transfers/1
  # GET /transfers/1.json
  def show
  end

  # GET /transfers/new
  def new
    @transfer = Transfer.new
    @transfer.elemento_id = @elemento.id
  end

  # GET /transfers/1/edit
  def edit
  end

  # POST /transfers
  # POST /transfers.json
  def create
    @transfer = Transfer.new(transfer_params)
    @transfer.elemento_id = @elemento.id
    @transfer.cuentaorigen = @elemento.cuentadante.nombre
    @elemento.cuentadante_id = @transfer.cuentadante_id
    @elemento.save
    respond_to do |format|
      if @transfer.save
        format.html { redirect_to elemento_transfers_path(@elemento), notice: 'Transfer was successfully created.' }
        format.json { render :show, status: :created, location: @transfer }
      else
        format.html { render :new }
        format.json { render json: @transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transfers/1
  # PATCH/PUT /transfers/1.json
  def update
    @transfer = Transfer.find(params[:id])
    @transfer.update_attributes(transfer_params)
    @elemento.cuentadante_id = @transfer.cuentadante_id
    @elemento.save
    respond_to do |format|
      if @transfer.update(transfer_params)
        format.html { redirect_to elemento_transfers_path(@elemento), notice: 'Transfer was successfully updated.' }
        format.json { render :show, status: :ok, location: @transfer }
      else
        format.html { render :edit }
        format.json { render json: @transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transfers/1
  # DELETE /transfers/1.json
  def destroy
    @transfer.destroy
    respond_to do |format|
      format.html { redirect_to elemento_transfers_url(@elemento), notice: 'Transfer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def alltransfers
    @transfers = Transfer.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transfer
      @elemento = Elemento.find(params[:elemento_id])
      @transfer = Transfer.find(params[:id]) if params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transfer_params
      params.require(:transfer).permit(:elemento_id, :cuentadante_id, :fechaTraspaso, :cuentaorigen)
    end
end
