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
      t.float :valor
      t.boolean :estado
      t.string :datoc
      t.string :datoe
      t.references :area, index: true
      t.integer :cuentadante_id
      t.string :marca
      t.float :cantidad
      t.float :valor_total

      t.timestamps
    end
  end
end
