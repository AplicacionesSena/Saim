class PaginaController < ApplicationController
	  before_filter :require_login, :except => [:saim]

  def saim
  end
end
