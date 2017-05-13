class Post < ApplicationRecord
  searchkick searchable: [:name, :dn, :category, :feature]
  has_attached_file :menuimg, styles: { :thumb => "100x100#", :small  => "150x150>", :medium => "200x200" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :menuimg, content_type: /\Aimage\/.*\z/
end
