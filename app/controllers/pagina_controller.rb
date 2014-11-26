class PaginaController < ApplicationController
	  before_filter :require_login, :except => [:saim]

  def saim
  end
  def bloqueo
  	@users = User.all
  end

  def elementosxcuentadantes
  	@cuentadantes = Cuentadante.all
  end

  def etraspasos
  	@traspasos = Traspaso.all
  	@elementos = Elemento.all
  end
end
