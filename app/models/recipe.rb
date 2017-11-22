class Recipe < ApplicationRecord
  has_many :quantities
  has_many :ingredients, through: :quantities
  has_many :favourites
  belongs_to :user

  accepts_nested_attributes_for :quantities
  accepts_nested_attributes_for :ingredients

  include PgSearch
   pg_search_scope :recipe_search,
    associated_against: {
      ingredients: [ :name ]
    }

  mount_uploader :photo, PhotoUploader

end
