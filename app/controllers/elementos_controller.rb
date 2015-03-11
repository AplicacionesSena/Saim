class ElementosController < ApplicationController
  before_action :set_elemento, only: [:show, :edit, :update, :destroy, :index, :new, :create], except: [:allelementos]
  # GET /elementos
  # GET /elementos.json
  def index
    @serial = params[:serial]
    @modelo = params[:modelo]
    @search = params[:placa]
    @nombre = params[:nombre]
    if @serial == nil && @modelo == nil && @nombre == nil
      @elementos = @cuentadante.elementos.search(params[:search])
    elsif @serial == nil && @search == nil && @nombre == nil
      @elementos = @cuentadante.elementos.modelo(params[:modelo])
    elsif @modelo == nil && @search == nil && @nombre == nil
      @elementos = @cuentadante.elementos.serial(params[:serial])
    elsif @modelo == nil && @search == nil && @serial == nil
      @elementos = @cuentadante.elementos.nombre(params[:nombre])
    end
    
  end
  

  # GET /elementos/1
  # GET /elementos/1.json
  def show

  end

  # GET /elementos/new
  def new
    @elemento = Elemento.new
  end

  # GET /elementos/1/edit
  def edit
  end

  # POST /elementos
  # POST /elementos.json
  def create
    @elemento = Elemento.new(elemento_params)
    @elemento.cuentadante_id = @cuentadante.id
    respond_to do |format|
      if @elemento.save
        format.html { redirect_to cuentadante_elementos_path(@cuentadante)}
        format.json { render :show, status: :created, location: @elemento }
      else
        format.html { render :new }
        format.json { render json: @elemento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /elementos/1
  # PATCH/PUT /elementos/1.json
  def update
    respond_to do |format|
      if @elemento.update(elemento_params)
        format.html { redirect_to cuentadante_elementos_path(@cuentadante)}
        format.json { render :show, status: :ok, location: @elemento }
      else
        format.html { render :edit }
        format.json { render json: @elemento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /elementos/1
  # DELETE /elementos/1.json
  def destroy
    @elemento.destroy
    respond_to do |format|
      format.html { redirect_to cuentadante_elementos_url(@cuentadante), notice: 'Elemento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def allelementos
    @serial = params[:serial]
    @modelo = params[:modelo]
    @search = params[:placa]
    @nombre = params[:nombre]
    if @serial == nil && @modelo == nil && @nombre == nil
      @elementos = Elemento.search(params[:search])
    elsif @serial == nil && @search == nil && @nombre == nil
      @elementos = Elemento.modelo(params[:modelo])
    elsif @modelo == nil && @search == nil && @nombre == nil
      @elementos = Elemento.serial(params[:serial])
    elsif @search == nil && @modelo == nil && @serial == nil
      @elementos = Elemento.nombre(params[:nombre])
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_elemento
      @cuentadante = Cuentadante.find(params[:cuentadante_id])
      @elemento = Elemento.find(params[:id]) if params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def elemento_params
      params.require(:elemento).permit(:placa, :tipo_elem_id, :nombre, :descripcion, :modelo, :serial, :fecha_adquisicion, :valor, :estado, :cuentadante_id, :datoc, :datoe)
    end
end
