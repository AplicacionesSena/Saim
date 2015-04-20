class ElementosController < ApplicationController
  before_action :set_elemento, only: [:show, :edit, :update, :destroy, :index, :new, :create], except: [:allelementos]

  # GET /elementos
  # GET /elementos.json
  def index
    @serial = params[:serial]
    @modelo = params[:modelo]
    @search = params[:search]
    @nombre = params[:nombre]
    
    if @nombre == nil && @modelo == nil && @serial == nil && @buscar == nil
      @elementos = @area.elementos.search(params[:search], params[:page])
    elsif @serial == nil && @search == nil && @nombre == nil && @buscar == nil
      @elementos = @area.elementos.modelo(params[:modelo], params[:page])
    elsif @modelo == nil && @search == nil && @nombre == nil && @buscar == nil
      @elementos = @area.elementos.serial(params[:serial], params[:page])
    elsif @modelo == nil && @search == nil && @serial == nil && @buscar == nil
      @elementos = @area.elementos.nombre(params[:nombre], params[:page])
    end

    @buscar = params[:buscar]
    if @serial == nil && @modelo == nil && @nombre == nil && @search == nil
      @elementos = @area.elementos.buscar(params[:buscar], params[:page])
    end
    @cargos = Cargo.all
  end

  # GET /elementos/1
  # GET /elementos/1.json
  def show
  end

  def import
    Elemento.import(params[:file])
    redirect_to root_url, notice: "Elementos Importados Con Exito."
    #@elemento.valor_total = @elemento.cantidad.to_i * @elemento.valor.to_i
    #@elemento.save
  end

  # GET /elementos/new
  def new
    @elemento = Elemento.new
    @elemento.placa = @elemento.placa
  end

  # GET /elementos/1/edit
  def edit
  end

  # POST /elementos
  # POST /elementos.json
  def create
    @cargos = Cargo.all
    @elemento = Elemento.new(elemento_params)
    @elemento.area_id = @area.id
    respond_to do |format|
      if @elemento.save
        format.html { redirect_to area_elementos_path(@area), notice: 'Elemento Creado con exito' }
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
        format.html { redirect_to area_elementos_path(@area), notice: 'Elemento actualizado con exito' }
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
      format.html { redirect_to area_elementos_url(@area), notice: 'Elemento eliminado con exito' }
      format.json { head :no_content }
    end
  end

  def allelementos
    @serial = params[:serial]
    @modelo = params[:modelo]
    @search = params[:placa]
    @nombre = params[:nombre]
    if @serial == nil && @modelo == nil && @nombre == nil
      @elementos = Elemento.search(params[:search], params[:page])
    elsif @serial == nil && @search == nil && @nombre == nil
      @elementos = Elemento.modelo(params[:modelo], params[:page])
    elsif @modelo == nil && @search == nil && @nombre == nil
      @elementos = Elemento.serial(params[:serial], params[:page])
    elsif @search == nil && @modelo == nil && @serial == nil
      @elementos = Elemento.nombre(params[:nombre], params[:page])
    end

    @buscar = params[:buscar]
    if @serial == nil && @modelo == nil && @nombre == nil && @search == nil
      @elementos = Elemento.buscar(params[:buscar], params[:page])
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_elemento
      @area = Area.find(params[:area_id])
      @elemento = Elemento.find(params[:id]) if params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def elemento_params
      params.require(:elemento).permit(:placa, :tipo_elem_id, :nombre, :descripcion, :modelo, :serial, :fecha_adquisicion, :valor, :estado, :area_id, :cuentadante_id, :cantidad, :valor_total, :marca)
    end
end
