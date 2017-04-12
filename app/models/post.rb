class Post < ApplicationRecord
  has_many :features
  has_attached_file :menuimg, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :menuimg, content_type: /\Aimage\/.*\z/
end
