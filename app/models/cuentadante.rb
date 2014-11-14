class Cuentadante < ActiveRecord::Base
  belongs_to :tipo_doc
  has_many :elementos, :dependent => :destroy
  has_many :traspasos, :dependent => :destroy
  	def self.search(search, page)
		where(['nombre  LIKE :s OR  documento LIKE :s', :s => "%#{search}%".upcase]).paginate(page: page, per_page: 2).order("id")
	end

  
end
