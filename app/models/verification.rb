class Verification < ApplicationRecord
  validates :fullname, presence: true,length: { maximum: 50 }
  validates :cardnumber, presence: true,length: { maximum: 10 }
  belongs_to :user
  mount_uploader :card, CardUploader
end
