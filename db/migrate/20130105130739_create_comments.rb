class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.string :body
      t.string :commenter_name
      t.integer :car_id
      t.timestamps
    end
  end
end
