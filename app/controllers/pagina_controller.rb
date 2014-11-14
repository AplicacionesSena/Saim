class PaginaController < ApplicationController
	  before_filter :require_login, :except => [:saim]

  def saim
  end
  def bloqueo
  	@users = User.all
  end
end
