class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.string :location
      t.timestamp :begin_at
      t.timestamp :end_at
      t.string :link
      t.text :description
      t.string :preview_image_file_name
      t.string :preview_image_content_type
      t.integer :preview_image_file_size
      t.datetime :preview_image_updated_at      

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
