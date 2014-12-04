class CreateTraceabilities < ActiveRecord::Migration
  def change
    create_table :traceabilities do |t|
      t.references :cuentadantes, index: true
      t.references :elementos, index: true
      t.references :events, index: true
      t.references :reintegros, index: true
      t.references :traspasos, index: true
      t.references :users, index: true

      t.timestamps
    end
  end
end
