class Item < ApplicationRecord
  belongs_to  :user
  has_many    :comments
  has_one_attached :image

  validates :title,      presence: true
  validates :concept,    presence: true
  validates :image,      presence: true

  def self.search(search)
    if search != ""
      Item.where('title LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end