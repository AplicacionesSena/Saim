class AreasController < ApplicationController
  before_action :set_area, only: [:show, :edit, :update, :destroy, :index, :new, :create]

  # GET /areas
  # GET /areas.json
  def index
    @areas = @floor.areas.all
    @serial = params[:serial]
    @modelo = params[:modelo]
    @search = params[:placa]
    if @serial == nil && @modelo == nil
      @elementos = Elemento.search(params[:search])
    elsif @serial == nil && @search == nil
      @elementos = Elemento.modelo(params[:modelo])
    elsif @modelo == nil && @search == nil
      @elementos = Elemento.serial(params[:serial])
    end
  end

  # GET /areas/1
  # GET /areas/1.json
  def show
  end

  # GET /areas/new
  def new
    @area = Area.new
  end

  # GET /areas/1/edit
  def edit
  end

  # POST /areas
  # POST /areas.json
  def create
    @area = Area.new(area_params)
    @area.floor_id = @floor.id
    respond_to do |format|
      if @area.save
        format.html { redirect_to floor_areas_path(@floor), notice: 'Area was successfully created.' }
        format.json { render :show, status: :created, location: @area }
      else
        format.html { render :new }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /areas/1
  # PATCH/PUT /areas/1.json
  def update
    respond_to do |format|
      if @area.update(area_params)
        format.html { redirect_to floor_areas_path(@floor), notice: 'Area was successfully updated.' }
        format.json { render :show, status: :ok, location: @area }
      else
        format.html { render :edit }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /areas/1
  # DELETE /areas/1.json
  def destroy
    @area.destroy
    respond_to do |format|
      format.html { redirect_to floor_areas_url(@floor), notice: 'Area was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area
      @floor = Floor.find(params[:floor_id])
      @area = Area.find(params[:id]) if params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def area_params
      params.require(:area).permit(:nombre, :coords, :shape, :floor_id, :image)
    end
end
