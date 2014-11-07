class Traspaso < ActiveRecord::Base
  belongs_to :elemento
  belongs_to :cuentadante
  after_update :recalculate_elementos

  private

  def recalculate_elementos
   Elemento.all.each {|d| d.save! }
  end
end
