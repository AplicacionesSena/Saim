class Traspaso < ActiveRecord::Base
  belongs_to :elemento
  belongs_to :cuentadante
  has_many :traceabilities
end
