module UsersHelper
	def bloq(estado)
		if estado == true
			"<span class='label label-success'>Activo</span>".html_safe
		else
			"<span class='label label-info'>Inactivo</span>".html_safe
		end
	end
end
