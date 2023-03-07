class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :title
      t.date :reservation_date
      t.integer :phone_number
      t.text :purpose
      t.string :location
      t.string :doctor_name
      t.references :user, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
