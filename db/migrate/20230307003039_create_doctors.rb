class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :specialty
      t.integer :years_of_experience
      t.text :bio
      t.integer :age
      t.text :qualifications
      t.string :location_of_work
      t.string :photo

      t.timestamps
    end
  end
end
