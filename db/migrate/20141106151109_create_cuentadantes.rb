class CreateCuentadantes < ActiveRecord::Migration
  def change
    create_table :cuentadantes do |t|
      t.string :nombre
      t.references :tipo_doc, index: true
      t.integer :documento
      t.string :telefono
      t.references :area, index: true

      t.timestamps
    end
  end
end
