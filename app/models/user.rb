class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :recipes
  has_many :favourites
  has_many :favourite_recipes, through: :favourites, source: :recipe

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, PhotoUploader

  # def favourited_recipes(recipe)
  #   favourites.find { |f| f.recipe == recipe}
  # end

  def favourite_for(recipe)
    Favourite.find_by(recipe: recipe, user: self)
  end
end
