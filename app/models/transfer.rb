class Transfer < ActiveRecord::Base
  belongs_to :elemento
  belongs_to :cuentadante
end
