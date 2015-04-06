class User < ActiveRecord::Base
  belongs_to :tipo_doc
  belongs_to :cargo
  has_many :events, :dependent => :destroy
  has_attached_file :foto, :default_url => "/users"
  do_not_validate_attachment_file_type :foto

  authenticates_with_sorcery!
  validates :nombre, presence: { :message => "Por favor Verifique que el campo no este vacio" } 
  validates :apellido, presence: { :message => "Por favor Verifique que el campo no este vacio" } 
  validates :email, presence: { :message => "Por favor Verifique que el campo no este vacio" } 
  validates :tipo_doc_id, presence: { :message => "Por favor Escoja un tipo de documento" } 
  validates :documento, presence: { :message => "Por favor Verifique que el campo no este vacio" } 
  validates :password, presence: { :message => "Por favor Verifique que el campo no este vacio" } 
  validates :password, length: { minimum: 8, :message => "Su contraseña es muy corta" } 
  validates :password, length: { maximum: 12, :message => "Su contraseña es muy larga" } 
  validates :password, confirmation: { :message => "Confirme su contraseña con el campo de lado" } 
  validates :password_confirmation, presence: { :message => "Por favor Verifique que el campo no este vacio" } 
  validates :email, uniqueness: { :message => "Por favor Verifique que el campo no este vacio" } 
  validates :documento, numericality: { :message => "Ingrese solo numeros por favor" } 

  	def self.search(search, page)
		where(['nombre  LIKE :s OR  documento LIKE :s', :s => "%#{search}%".upcase]).paginate(page: page, per_page: 6).order("id")
	end
end
