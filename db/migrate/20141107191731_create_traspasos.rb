class CreateTraspasos < ActiveRecord::Migration
  def change
    create_table :traspasos do |t|
      t.references :elemento, index: true
      t.references :cuentadante, index: true
      t.datetime :fechaTraspaso

      t.timestamps
    end
  end
end
