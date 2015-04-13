class PaginaController < ApplicationController
	  before_filter :require_login, :except => [:saim]

  def saim
  end

  def bloqueo
  	@users = User.search(params[:search], params[:page])
  end

  def estadisticas
  end

  def elementosxareas
    @areas = Area.all
    @elementos = Elemento.all
  end

  def elementosxcuentadantes
  	@cuentadantes = Cuentadante.all
    @elementos = Elemento.all
  end

  def etraspasos
  	@transfers = Transfer.all
  	@elementos = Elemento.all
  end

  def estreintgr
    
  end
  def ereintegros
    @reintegros = Reintegro.all
    @elementos = Elemento.all
  end
  
  def traceability
    @elementos = Elemento.all
  end

  def index
    @areas = Area.all
    @serial = params[:serial]
    @modelo = params[:modelo]
    @search = params[:search]
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
    
  end

  def plano
  end
  def contactenos
  end
end
