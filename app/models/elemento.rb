class Elemento < ActiveRecord::Base
  belongs_to :tipo_elem
  belongs_to :cuentadante
  belongs_to :area
  has_many :traspasos
  has_many :reintegros
  has_many :traceabilities
  
 	#def self.search(search, page)
	#	where(['placa LIKE :s OR nombre  LIKE :s OR modelo LIKE :s OR serial LIKE :s', :s => "%#{search}%".upcase]).paginate(page: page, per_page: 2).order("id")
	#end
end
