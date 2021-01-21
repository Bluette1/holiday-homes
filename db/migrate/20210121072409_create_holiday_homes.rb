class CreateHolidayHomes < ActiveRecord::Migration[6.1]
  def change
    create_table :holiday_homes do |t|
      t.string :title, null: false
      t.string :owner, :default => ''
      t.string :manager, :default => ''
      t.text :address, null: false
      t.string :image_url, :default => ''
      t.text :description, limit: 1000
      t.string :email, :default => ''
      t.string :phone, :default => ''

      t.timestamps
    end
  end
end
