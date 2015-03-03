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
    if @serial == nil && @modelo == nil
      @elementos = Elemento.search(params[:search])
    elsif @serial == nil && @search == nil
      @elementos = Elemento.modelo(params[:modelo])
    elsif @modelo == nil && @search == nil
      @elementos = Elemento.serial(params[:serial])
    end
  end

  def plano
  end

  def piso2
  end

  def obra1
  end

  def obra2
  end

  def obra3
  end
  
  def obra4
  end
  
  def obra5
  end
  
  def obra6
  end
  
  def obra7
  end
  
  def obra8
  end
  
  def obra9
  end
  
  def obra10
  end
  
  def obra11
  end
  
  def obra12
  end
  
  def obra13
  end
  
  def obra14
  end
  
  def obra15
  end
  
  def obra16
  end
end
