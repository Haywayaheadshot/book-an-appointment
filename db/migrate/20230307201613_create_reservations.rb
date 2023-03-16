class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :title
      t.date :reservation_date
      t.integer :phone_number
      t.text :purpose
      t.string :location
      t.references :user, foreign_key: { to_table: 'users' }
      t.references :doctor, null: false, foreign_key: true
      t.timestamps
    end
  end
end
