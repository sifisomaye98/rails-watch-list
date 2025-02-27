class Movie < ApplicationRecord
  has_many :bookmarks
  validate :cannot_delete_if_bookmarked

  validates :title, uniqueness: true
  validates :overview, :title, presence: true

  private
  def cannot_delete_if_bookmarked
    if bookmarks.any?
      errors.add(:base, 'cannot delete a movie if it is referenced in at least one bookmark.')
    end
  end
end
