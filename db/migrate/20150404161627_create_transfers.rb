class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.references :elemento, index: true
      t.references :cuentadante, index: true
      t.datetime :fechaTraspaso

      t.timestamps
    end
  end
end
