class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :title
      t.text :content
      t.timestamps null: false
    end
    add_column :pictures, :user_id, :integer
  end
end
