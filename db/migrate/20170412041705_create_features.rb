class CreateFeatures < ActiveRecord::Migration[5.0]
  def change
    create_table :features do |t|
      t.string :concept
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
