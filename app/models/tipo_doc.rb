class TipoDoc < ActiveRecord::Base
	has_many :users, :dependent => :destroy
	has_many :cuentadantes, :dependent => :destroy
end
