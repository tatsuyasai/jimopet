class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.integer :user_id 
      t.integer :age
      
      t.string :type
      t.string :image
      t.string :gender
      t.string :prefecture
      t.string :city
      
      t.text :description
      

      t.timestamps
    end
  end
end
