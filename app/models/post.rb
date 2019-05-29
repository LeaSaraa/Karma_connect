class Post < ApplicationRecord
  belongs_to :user
  has_many :compliments, dependent: :destroy

  validates :address, presence: true

  mount_uploader :picture, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
