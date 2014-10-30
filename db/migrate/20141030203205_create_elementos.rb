class CreateElementos < ActiveRecord::Migration
  def change
    create_table :elementos do |t|
      t.integer :placa
      t.references :tipo_elem, index: true
      t.string :nombre
      t.text :descripcion
      t.string :modelo
      t.string :serial
      t.datetime :fecha_adquisicion
      t.integer :valor
      t.boolean :estado
      t.references :cuentadante, index: true

      t.timestamps
    end
  end
end
