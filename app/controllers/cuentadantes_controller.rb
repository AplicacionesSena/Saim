class CuentadantesController < ApplicationController
  before_action :set_cuentadante, only: [:show, :edit, :update, :destroy]

  # GET /cuentadantes
  # GET /cuentadantes.json
  def index
    @elementos = Elemento.all
    @cuentadantes = Cuentadante.all
    @search = params[:nombre]
    @documento = params[:documento]
    if @documento == nil
      @cuentadantes = Cuentadante.search(params[:search], params[:page])
    elsif @search == nil
      @cuentadantes = Cuentadante.documento(params[:documento], params[:page])
    end
  end

  # GET /cuentadantes/1
  # GET /cuentadantes/1.json
  def show
  end

  def import
    Cuentadante.import(params[:file])
    redirect_to root_url, notice: "Cuentadantes Importados Con Exito."
  end

  # GET /cuentadantes/new
  def new
    @cuentadante = Cuentadante.new
  end

  # GET /cuentadantes/1/edit
  def edit
  end

  # POST /cuentadantes
  # POST /cuentadantes.json
  def create
    @cuentadante = Cuentadante.new(cuentadante_params)

    respond_to do |format|
      if @cuentadante.save
        format.html { redirect_to @cuentadante, notice: 'Cuentadante was successfully created.' }
        format.json { render :show, status: :created, location: @cuentadante }
      else
        format.html { render :new }
        format.json { render json: @cuentadante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cuentadantes/1
  # PATCH/PUT /cuentadantes/1.json
  def update
    respond_to do |format|
      if @cuentadante.update(cuentadante_params)
        format.html { redirect_to @cuentadante, notice: 'Cuentadante was successfully updated.' }
        format.json { render :show, status: :ok, location: @cuentadante }
      else
        format.html { render :edit }
        format.json { render json: @cuentadante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cuentadantes/1
  # DELETE /cuentadantes/1.json
  def destroy
    @cuentadante.destroy
    respond_to do |format|
      format.html { redirect_to cuentadantes_url, notice: 'Cuentadante was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def allcuentadantes
    @cuentadantes = Cuentadante.search(params[:search], params[:page])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cuentadante
      @cuentadante = Cuentadante.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cuentadante_params
      params.require(:cuentadante).permit(:nombre, :tipo_doc_id, :documento, :telefono, :area_id)
    end
end
