class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  attachment :profile_image, destroy: false

  # フォローする際の関係性の定義
  has_many :relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :followers, through: :relationships, source: :followed

  # フォローされる際の関係性の定義
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followees, through: :reverse_of_relationships, source: :following


  # 自分が誰かをフォローしているか判定
  def following?(user)
    followees.include?(user)
  end



  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true
  validates :introduction, length: {maximum: 50}
end
