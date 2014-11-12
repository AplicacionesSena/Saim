class User < ActiveRecord::Base
  belongs_to :tipo_doc
  belongs_to :cargo
  has_attached_file :foto, :default_url => "/users"
  do_not_validate_attachment_file_type :foto

  authenticates_with_sorcery!

  validates :password, length: { minimum: 8 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true

  	def self.search(search, page)
		where(['nombre  LIKE :s OR  documento LIKE :s', :s => "%#{search}%".upcase]).paginate(page: page, per_page: 2).order("id")
	end
end
