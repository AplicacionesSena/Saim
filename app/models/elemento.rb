class Elemento < ActiveRecord::Base
  belongs_to :tipo_elem
  belongs_to :cuentadante
  belongs_to :area
  has_many :traspasos
  has_many :reintegros
  has_many :traceabilities
  
 	def self.search(search, serial)
		where(['placa LIKE :s OR nombre  LIKE :s OR modelo LIKE :s OR serial LIKE :s', :s => "%#{search}%", :s => "%#{modelo}%", :s => "%#{serial}%".upcase]).paginate(page: page, per_page: 4).order("id")
	end
end
