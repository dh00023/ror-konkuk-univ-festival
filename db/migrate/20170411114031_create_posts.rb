class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.float :x
      t.float :y
      t.string :dn
      t.string :address #대력적인 위치 직접입력
      t.string :category #귀여운 이런거
      t.string :feature #안주쌈 이런거
      t.timestamps
    end
  end
end
