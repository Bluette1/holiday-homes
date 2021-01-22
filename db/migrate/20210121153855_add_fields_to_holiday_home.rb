class AddFieldsToHolidayHome < ActiveRecord::Migration[6.1]
  def change
    add_column :holiday_homes, :category, :string
    add_column :holiday_homes, :price, :integer
    add_column :holiday_homes, :rating, :integer
  end
end
