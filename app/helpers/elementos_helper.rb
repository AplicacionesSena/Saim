module ElementosHelper
	def est(estado)
		if estado == true
			"<span class='label label-success'>Bueno</span>".html_safe
		else
			"<span class='label label-info'>Malo</span>".html_safe
		end
	end
end
