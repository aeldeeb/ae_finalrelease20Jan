class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.string :name
      t.string :email
      t.string :city
      t.integer :phone
      
      t.timestamps
    end
  end
end
