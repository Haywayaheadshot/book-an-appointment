class CreateDoctorsReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors_reservations do |t|
      t.references :doctor, null: false, foreign_key: {to_table: 'doctors'}
      t.references :reservation, null: false, foreign_key: {to_table: 'reservations'}

      t.timestamps
    end
  end
end
