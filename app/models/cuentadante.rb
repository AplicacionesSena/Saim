class Cuentadante < ActiveRecord::Base
  belongs_to :tipo_doc
  has_many :elementos, :dependent => :destroy
  has_many :transfers, :dependent => :destroy
  has_many :reintegros, :dependent => :destroy
  belongs_to :area

  validates :nombre, presence: { :message => "Por favor Verifique que el campo no este vacio" }
  validates :tipo_doc_id, presence: { :message => "Por favor Escoja un tipo de documento" }
  validates :documento, presence: { :message => "Por favor Verifique que el campo no este vacio" }
  validates :documento, numericality: { :message => "Ingrese solo numeros por favor" }
  validates :telefono, presence: { :message => "Por favor Verifique que el campo no este vacio" }
  validates :telefono, numericality: { :message => "Ingrese solo numeros por favor" }

  def self.search(search, page)
		where(['nombre LIKE :s', :s => "%#{search}%".upcase]).paginate(page: page, per_page: 5).order("id")
	end
	def self.documento(documento, page)
		where(['documento LIKE :m', :m => "%#{documento}%".upcase]).paginate(page: page, per_page: 5).order("id")
	end
	def self.import(file)
    	CSV.foreach(file.path, headers: true) do |row|
        Elemento.create! row.to_hash
    	end
    end
end
