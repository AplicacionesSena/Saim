class TipoElemsController < ApplicationController
  before_action :set_tipo_elem, only: [:show, :edit, :update, :destroy]

  # GET /tipo_elems
  # GET /tipo_elems.json
  def index
    @tipo_elems = TipoElem.all
  end

  # GET /tipo_elems/1
  # GET /tipo_elems/1.json
  def show
  end

  # GET /tipo_elems/new
  def new
    @tipo_elem = TipoElem.new
  end

  # GET /tipo_elems/1/edit
  def edit
  end

  # POST /tipo_elems
  # POST /tipo_elems.json
  def create
    @tipo_elem = TipoElem.new(tipo_elem_params)

    respond_to do |format|
      if @tipo_elem.save
        format.html { redirect_to @tipo_elem, notice: 'Tipo elem was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_elem }
      else
        format.html { render :new }
        format.json { render json: @tipo_elem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_elems/1
  # PATCH/PUT /tipo_elems/1.json
  def update
    respond_to do |format|
      if @tipo_elem.update(tipo_elem_params)
        format.html { redirect_to @tipo_elem, notice: 'Tipo elem was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_elem }
      else
        format.html { render :edit }
        format.json { render json: @tipo_elem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_elems/1
  # DELETE /tipo_elems/1.json
  def destroy
    @tipo_elem.destroy
    respond_to do |format|
      format.html { redirect_to tipo_elems_url, notice: 'Tipo elem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_elem
      @tipo_elem = TipoElem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_elem_params
      params.require(:tipo_elem).permit(:nombre, :descripcion)
    end
end
