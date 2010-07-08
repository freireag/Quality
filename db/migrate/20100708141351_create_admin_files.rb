class CreateAdminFiles < ActiveRecord::Migration
  def self.up
    create_table :admin_files do |t|
      t.string :title
      t.string :permission
      t.references :course
      t.references :user
      t.string :attachment_file_name
      t.string :attachment_content_type
      t.integer :attachment_file_size
      t.datetime :attachment_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :admin_files
  end
end
