class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
   has_many :articles
   has_many :comments

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: { case_sensitive: true }, format: {with: /@.+/, message: "は＠を含んでください"}
    validates :birthday
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, {with: PASSWORD_REGEX, message: "は半角英数字で入力してください" }
       

end






