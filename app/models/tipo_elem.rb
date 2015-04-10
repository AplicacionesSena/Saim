class TipoElem < ActiveRecord::Base
	has_many :elementos, :dependent => :destroy
end
