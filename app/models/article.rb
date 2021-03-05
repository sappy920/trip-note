class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :country

  
  with_options presence: true do
    validates :instruction, :image
    validates :category_id, :country_id, numericality: { other_than: 0}
  end

  
end
