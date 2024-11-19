class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :media, MediaUploader

  validates :title, presence: true
  validates :media, presence: true

  enum media_type: { image: 'image', video: 'video', audio: 'audio' }
end
