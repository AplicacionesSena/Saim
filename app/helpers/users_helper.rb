module UsersHelper
	def bloq(estado)
		if estado == true
			"<span class='label label-success'>Activ@</span>".html_safe
		else
			"<span class='label label-info'>Inactiv@</span>".html_safe
		end
	end
end
