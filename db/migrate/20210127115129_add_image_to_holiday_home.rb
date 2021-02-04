class AddImageToHolidayHome < ActiveRecord::Migration[6.1]
  def change
    add_attachment :holiday_homes, :image
  end
end
