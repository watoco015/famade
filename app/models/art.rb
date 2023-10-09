class Art < ApplicationRecord

  validates :title,          presence: true
  validates :content,        presence: true
  validates :category_id,    presence: true
  validates :subcategory_id, presence: true


  has_many_attached :images

  belongs_to :users
  has_many :comments
  has_many :favorites
end
