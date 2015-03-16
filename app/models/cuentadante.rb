class Cuentadante < ActiveRecord::Base
  belongs_to :tipo_doc
  has_many :elementos, :dependent => :destroy
  belongs_to :area
end
