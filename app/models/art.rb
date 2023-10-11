class Art < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :subcategory

  
  validates :title,          presence: true
  validates :content,        presence: true
  validates :category_id,    numericality: { other_than: 1 , message: "can't be blank"}
  validates :subcategory_id, numericality: { other_than: 1 , message: "can't be blank"}


  has_one_attached :image

  belongs_to :user
  has_many :comments
  has_many :favorites
end
