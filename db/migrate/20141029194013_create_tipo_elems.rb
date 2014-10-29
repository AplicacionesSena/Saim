class CreateTipoElems < ActiveRecord::Migration
  def change
    create_table :tipo_elems do |t|
      t.string :nombre
      t.text :descripcion

      t.timestamps
    end
  end
end
