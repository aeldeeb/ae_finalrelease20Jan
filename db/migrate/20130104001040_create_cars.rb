class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.string :color
      t.datetime :year
      t.integer :mileage
      t.integer :cc
      t.string :transmission
      t.boolean :ac
      t.boolean :power_steering
      t.boolean :electric_glasses
      t.integer :doors
      t.text :notes
      t.integer :seller_id
      t.timestamps
    end
  end
end
