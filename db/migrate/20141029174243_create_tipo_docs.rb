class CreateTipoDocs < ActiveRecord::Migration
  def change
    create_table :tipo_docs do |t|
      t.string :sigla
      t.text :descripcion

      t.timestamps
    end
  end
end
