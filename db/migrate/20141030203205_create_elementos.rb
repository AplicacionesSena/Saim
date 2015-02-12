class CreateElementos < ActiveRecord::Migration
  def change
    create_table :elementos do |t|
      t.string :placa
      t.references :tipo_elem, index: true
      t.string :nombre
      t.text :descripcion
      t.string :modelo
      t.string :serial
      t.datetime :fecha_adquisicion
      t.string :valor
      t.boolean :estado
      t.string :datoc
      t.references :cuentadante, index: true
      #t.references :area, index: true

      t.timestamps
    end
  end
end
