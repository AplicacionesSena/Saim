class ReintegrosController < ApplicationController
  before_action :set_reintegro, only: [:show, :edit, :update, :destroy, :index, :new, :create], except: [:allreintegros]

  # GET /reintegros
  # GET /reintegros.json
  def index
    @reintegros = @elemento.reintegros.all
  end

  # GET /reintegros/1
  # GET /reintegros/1.json
  def show
  end

  # GET /reintegros/new
  def new
    @reintegro = Reintegro.new
    @reintegro.elemento_id = @elemento.id
  end

  # GET /reintegros/1/edit
  def edit
  end

  # POST /reintegros
  # POST /reintegros.json
  def create
    @reintegro = Reintegro.new(reintegro_params)
    @reintegro.elemento_id = @elemento.id
    @elemento.cuentadante_id = @reintegro.cuentadante_id
    @elemento.save
    respond_to do |format|
      if @reintegro.save
        format.html { redirect_to elemento_reintegros_path(@elemento), notice: 'Reintegro was successfully created.' }
        format.json { render :show, status: :created, location: @reintegro }
      else
        format.html { render :new }
        format.json { render json: @reintegro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reintegros/1
  # PATCH/PUT /reintegros/1.json
  def update
    @reintegro = Reintegro.find(params[:id])
    @reintegro.update_attributes(reintegro_params)
    @elemento.cuentadante_id = @reintegro.cuentadante_id
    @elemento.save
    respond_to do |format|
      if @reintegro.update(reintegro_params)
        format.html { redirect_to elemento_reintegros_path(@elemento), notice: 'Reintegro was successfully updated.' }
        format.json { render :show, status: :ok, location: @reintegro }
      else
        format.html { render :edit }
        format.json { render json: @reintegro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reintegros/1
  # DELETE /reintegros/1.json
  def destroy
    @reintegro.destroy
    respond_to do |format|
      format.html { redirect_to elemento_reintegros_url(@elemento), notice: 'Reintegro was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def allreintegros
    @reintegros = Reintegro.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reintegro
      @elemento = Elemento.find(params[:elemento_id])
      @reintegro = Reintegro.find(params[:id]) if params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reintegro_params
      params.require(:reintegro).permit(:elemento_id, :cuentadante_id, :fechaReintegro)
    end
end
