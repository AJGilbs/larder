class Recipe < ApplicationRecord
  has_many :quantities, dependent: :destroy
  has_many :ingredients, through: :quantities
  has_many :favourites, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :quantities

  include PgSearch
  pg_search_scope :recipe_search,
  associated_against: {
    ingredients: [ :name ]
  }

  mount_uploader :photo, PhotoUploader

  def favourited?(user)
    Favourite.find_by(user: user, recipe: self)
  end
end
