class Cuentadante < ActiveRecord::Base
	
  	belongs_to :tipo_doc
  	belongs_to :area
  	has_many :elementos, :dependent => :destroy
  	has_many :traspasos, :dependent => :destroy
  	has_many :traceabilities


  	def self.search(search, page)
		where(['nombre  LIKE :s OR  documento LIKE :s', :s => "%#{search}%".upcase]).paginate(page: page, per_page: 4).order("id")
	end

	def self.import(file)
		accessible_attributes = ["id", "nombre", "tipo_doc_id", "documento", "telefono", "area_id"]
		::CSV.foreach(file.path, headers: true) do |row|
			cuentadantes = find_by_id(row["id"]) || new
			cuentadantes.attributes = row.to_hash.slice(*accessible_attributes)
			cuentadantes.save! if cuentadantes.id != row["id"] && row["id"] != nil
		end
	end 

end
