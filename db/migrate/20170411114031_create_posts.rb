class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.float :x
      t.float :y
      t.string :type

      t.timestamps
    end
  end
end
