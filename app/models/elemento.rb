class Elemento < ActiveRecord::Base
  belongs_to :tipo_elem
  belongs_to :cuentadante
  belongs_to :area
  has_many :traspasos
  has_many :reintegros
  has_many :traceabilities
  
 	def self.search(search)
		where(['placa LIKE :s', :s => "%#{search}%".upcase])
	end
	def self.modelo(modelo)
		where(['modelo LIKE :m', :m => "%#{modelo}%".upcase])
	end
	def self.serial(serial)
		where(['serial LIKE :w', :w => "%#{serial}%".upcase])
	end
	def self.nombre(nombre)
		where(['nombre LIKE :x', :x => "%#{nombre}%".upcase])
	end
end
