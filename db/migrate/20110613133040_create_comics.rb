class CreateComics < ActiveRecord::Migration
  def self.up
    create_table :comics do |t|
      t.string :title
      t.string :comic_picture_file_name
      t.string :comic_picture_content_type
      t.string :comic_picture_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :comics
  end
end
