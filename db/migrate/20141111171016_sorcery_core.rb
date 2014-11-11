class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :nombre,			:null => false
    	t.string :apellido,			:null => false
      	t.string :email,            :null => false
      	t.integer :tipo_doc, 		index: true
      	t.integer :documento,		:null => false
      	t.integer :cargo,			index: true
      	t.boolean :genero,			:null => false
      	t.string :crypted_password, :null => false
      	t.string :salt,             :null => false

      	t.timestamps
    end

    add_index :users, :email, unique: true
  end
end