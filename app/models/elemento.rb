class Elemento < ActiveRecord::Base
  belongs_to :tipo_elem
  belongs_to :cuentadante
end
