class AddFeatureToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :feature, :string
  end
end
