class AddAttachmentMenuimgToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :menuimg
    end
  end

  def self.down
    remove_attachment :posts, :menuimg
  end
end
