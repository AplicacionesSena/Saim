class CreateCuentadantes < ActiveRecord::Migration
  def change
    create_table :cuentadantes do |t|
      t.string :nombre
      t.references :tipo_doc, index: true
      t.string :documento
      t.string :telefono
      t.integer :area_id

      t.timestamps
    end
  end
end
