class Elemento < ActiveRecord::Base
  belongs_to :tipo_elem
  belongs_to :area
  belongs_to :cuentadante
  has_many :transfers, :dependent => :destroy
  has_many :reintegros, :dependent => :destroy

  before_validation :set_valor_total

  def set_valor_total
  	self.valor_total = cantidad.to_i * valor.to_i
  end

  	def self.search(search, page)
		where(['placa LIKE :s', :s => "%#{search}%".upcase]).paginate(page: page, per_page: 1).order("id")
	end
	def self.modelo(modelo, page)
		where(['modelo LIKE :m', :m => "%#{modelo}%".upcase]).paginate(page: page, per_page: 1).order("id")
	end
	def self.serial(serial, page)
		where(['serial LIKE :w', :w => "%#{serial}%".upcase]).paginate(page: page, per_page: 1).order("id")
	end
	def self.nombre(nombre, page)
		where(['nombre LIKE :x', :x => "%#{nombre}%".upcase]).paginate(page: page, per_page: 1).order("id")
	end
	def self.buscar(buscar, page)
		where(['nombre LIKE :z OR placa LIKE :z OR modelo LIKE :z OR serial LIKE :z', :z => "%#{buscar}%".upcase]).paginate(page: page, per_page: 5).order("id")
	end

	def self.import(file)
    	CSV.foreach(file.path, headers: true) do |row|
    		if row["area_id"] == nil
    			row["area_id"] = 45
    		else
    			
    		end
    		row["valor_total"] = row["cantidad.to_i * valor.to_i"]
        Elemento.create! row.to_hash
    end
end
end
