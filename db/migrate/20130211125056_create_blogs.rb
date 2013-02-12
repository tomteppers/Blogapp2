class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :titel
      t.string :description

      t.timestamps
    end
  end
end
