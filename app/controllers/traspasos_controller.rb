class TraspasosController < ApplicationController
  before_action :set_traspaso, only: [:show, :edit, :update, :destroy, :index, :new, :create]
  
  # GET /traspasos
  # GET /traspasos.json
  def index
    @traspasos = @elemento.traspasos.all
  end

  # GET /traspasos/1
  # GET /traspasos/1.json
  def show
  end

  # GET /traspasos/new
  def new
    @traspaso = Traspaso.new
    @traspaso.elemento_id = @elemento.id
  end

  # GET /traspasos/1/edit
  def edit
  end

  # POST /traspasos
  # POST /traspasos.json
  def create
    @traspaso = Traspaso.new(traspaso_params)
    @traspaso.elemento_id = @elemento.id
    respond_to do |format|
      if @traspaso.save
        format.html { redirect_to elemento_traspasos_path(@elemento), notice: 'Traspaso was successfully created.' }
        format.json { render :show, status: :created, location: @traspaso }
      else
        format.html { render :new }
        format.json { render json: @traspaso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /traspasos/1
  # PATCH/PUT /traspasos/1.json
  def update
    @traspaso = Traspaso.find(params[:id])
    respond_to do |format|
      if @traspaso.update(traspaso_params)
        format.html { redirect_to elemento_traspasos_path(@elemento), notice: 'Traspaso was successfully updated.' }
        format.json { render :show, status: :ok, location: @traspaso }
      else
        format.html { render :edit }
        format.json { render json: @traspaso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /traspasos/1
  # DELETE /traspasos/1.json
  def destroy
    @traspaso.destroy
    respond_to do |format|
      format.html { redirect_to elemento_traspasos_url(@elemento), notice: 'Traspaso was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_traspaso
      @elemento = Elemento.find(params[:elemento_id])
      @traspaso = Traspaso.find(params[:id]) if params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def traspaso_params
      params.require(:traspaso).permit(:elemento_id, :cuentadante_id, :fechaTraspaso)
    end
end
