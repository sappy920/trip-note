class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture

  
  with_options presence: true do
    validates :instruction, :image, :country
    validates :category_id,  numericality: { other_than: 0}
  end

  def self.search(search)
    if search != ""
      Article.where('instruction LIKE(?)', "%#{search}%")
    else
      Article.all
    end
  end


end
