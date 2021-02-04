class AddCreatorIdToHolidayHomes < ActiveRecord::Migration[6.1]
  def change
    add_reference :holiday_homes, :creator, null: false, foreign_key: { to_table: :users }
  end
end
