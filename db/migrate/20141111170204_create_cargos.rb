class CreateCargos < ActiveRecord::Migration
  def change
    create_table :cargos do |t|
      t.string :nombre
      t.text :descripcion
      t.boolean :privilegioVer
      t.boolean :privilegioEditar
      t.boolean :privilegioEleminar
      t.boolean :privilegioCrear

      t.timestamps
    end
  end
end
