class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :nombre
      t.string :shape
      t.string :coords
      t.references :floor, index: true

      t.timestamps
    end
  end
end
