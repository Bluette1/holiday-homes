class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :holiday_homes, foreign_key: :creator_id, class_name: 'HolidayHome', dependent: :destroy
  has_many :favourites, foreign_key: :user_id, class_name: 'Favourite', dependent: :destroy

  has_attached_file :photo,
                    storage: :cloudinary,
                    path: ':id/:style/:filename',
                    styles: { medium: '300x300>', thumb: '100x100>' },
                    default_url: ':style/photo.png'

  validates_attachment_content_type :photo, content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
end
