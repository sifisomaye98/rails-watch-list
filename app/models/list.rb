class List < ApplicationRecord

  has_many :bookmarks, dependent: :destroy
  # list.bookmarks -> returns all the bookmarks on that list
  has_many :movies, through: :bookmarks, dependent: :destroy
  # list.movies
  validates :name,  presence: true
  validates :name,  uniqueness: true

end
