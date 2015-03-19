class Elemento < ActiveRecord::Base
  belongs_to :tipo_elem
  belongs_to :area
  belongs_to :cuentadante
  has_many :trapasos, :dependent => :destroy
  has_many :reintegros, :dependent => :destroy

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

	def self.import(file)
    	CSV.foreach(file.path, headers: true) do |row|
        Elemento.create! row.to_hash
    end
end
end
