class TipoDocsController < ApplicationController
  before_action :set_tipo_doc, only: [:show, :edit, :update, :destroy]

  # GET /tipo_docs
  # GET /tipo_docs.json
  def index
    @tipo_docs = TipoDoc.all
  end

  # GET /tipo_docs/1
  # GET /tipo_docs/1.json
  def show
  end

  # GET /tipo_docs/new
  def new
    @tipo_doc = TipoDoc.new
  end

  # GET /tipo_docs/1/edit
  def edit
  end

  # POST /tipo_docs
  # POST /tipo_docs.json
  def create
    @tipo_doc = TipoDoc.new(tipo_doc_params)

    respond_to do |format|
      if @tipo_doc.save
        format.html { redirect_to @tipo_doc, notice: 'Tipo doc was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_doc }
      else
        format.html { render :new }
        format.json { render json: @tipo_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_docs/1
  # PATCH/PUT /tipo_docs/1.json
  def update
    respond_to do |format|
      if @tipo_doc.update(tipo_doc_params)
        format.html { redirect_to @tipo_doc, notice: 'Tipo doc was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_doc }
      else
        format.html { render :edit }
        format.json { render json: @tipo_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_docs/1
  # DELETE /tipo_docs/1.json
  def destroy
    @tipo_doc.destroy
    respond_to do |format|
      format.html { redirect_to tipo_docs_url, notice: 'Tipo doc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_doc
      @tipo_doc = TipoDoc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_doc_params
      params.require(:tipo_doc).permit(:sigla, :descripcion)
    end
end
