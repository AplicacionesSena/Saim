class AddAttachmentImageToFloors < ActiveRecord::Migration
  def self.up
     add_column :floors, :image_file_name,    :string
     add_column :floors, :image_content_type, :string
     add_column :floors, :image_file_size,    :integer
     add_column :floors, :image_updated_at,   :datetime
   end
 
   def self.down
    remove_column :floors, :image_file_name
    remove_column :floors, :image_content_type
    remove_column :floors, :image_file_size
    remove_column :floors, :image_updated_at
  end
end
