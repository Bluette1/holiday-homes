class Favourite < ApplicationRecord
  belongs_to :holiday_home
  belongs_to :user

  validates :user, uniqueness: { scope: :holiday_home }
end
