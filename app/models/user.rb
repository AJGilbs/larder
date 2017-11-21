class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, PhotoUploader

  # def favourited_recipes(recipe)
  #   favourites.find { |f| f.recipe == recipe}
  # end

  has_many :favourites
  has_many :favourite_recipes, through: :favourites, source: :recipe


end
