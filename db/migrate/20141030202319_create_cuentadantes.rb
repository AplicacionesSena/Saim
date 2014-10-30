class CreateCuentadantes < ActiveRecord::Migration
  def change
    create_table :cuentadantes do |t|
      t.string :nombre
      t.references :tipo_doc, index: true
      t.integer :documento
      t.integer :cantidad_elementos
      t.string :nombre_elementos
      t.string :valor_elementos

      t.timestamps
    end
  end
end
