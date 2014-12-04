class Traceability < ActiveRecord::Base
  belongs_to :cuentadantes
  belongs_to :elementos
  belongs_to :events
  belongs_to :reintegros
  belongs_to :traspasos
  belongs_to :users
  has_many :traceabilities
end
