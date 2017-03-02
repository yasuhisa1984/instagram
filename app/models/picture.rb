class Picture < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :user
  #Model Picture.picture と、アップローダー ImageUploader とをひも付け。
  mount_uploader :picture, PictureUploader
end
