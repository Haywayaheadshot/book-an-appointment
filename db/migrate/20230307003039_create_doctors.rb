class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :specialty
      t.string :years_of_experience
      t.text :bio
      t.integer :age
      t.text :achievements
      t.string :location_of_work

      t.timestamps
    end
  end
end
