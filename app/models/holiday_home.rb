class HolidayHome < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_attached_file :image,
                    storage: :cloudinary,
                    path: ':id/:style/:filename',
                    styles: { medium: '600x600>', thumb: '300x300>' },
                    default_url: ':style/home_img.jpg'

  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
end
