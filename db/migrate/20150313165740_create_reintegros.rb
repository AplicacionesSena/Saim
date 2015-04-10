class CreateReintegros < ActiveRecord::Migration
  def change
    create_table :reintegros do |t|
      t.references :elemento, index: true
      t.references :cuentadante, index: true
      t.datetime :fechaReintegro

      t.timestamps
    end
  end
end
