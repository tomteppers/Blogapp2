class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :titel
      t.text :content
      t.integer :blog_id

      t.timestamps
    end
  end
end
