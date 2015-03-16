class PaginaController < ApplicationController
	  before_filter :require_login, :except => [:saim]

  def saim
  end

  def bloqueo
  	@users = User.all
  end

  def estadisticas
  end

  def elementosxcuentadantes
  	@cuentadantes = Cuentadante.all
  end

  def etraspasos
  	@traspasos = Traspaso.all
  	@elementos = Elemento.all
  end

  def ereintgros
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
    @search = params[:placa]
    @nombre = params[:nombre]
    if @serial == nil && @modelo == nil && @nombre == nil
      @elementos = @area.elementos.search(params[:search])
    elsif @serial == nil && @search == nil && @nombre == nil
      @elementos = @area.elementos.modelo(params[:modelo])
    elsif @modelo == nil && @search == nil && @nombre == nil
      @elementos = @area.elementos.serial(params[:serial])
    elsif @search == nil && @modelo == nil && @serial == nil
      @elementos = @area.elementos.nombre(params[:nombre])
    end
    
  end

  def plano
  end
end
