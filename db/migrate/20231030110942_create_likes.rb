class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|


      t.references :user, foreign_key: true
      
      t.integer :likable_id
      t.string :likable_type
      
      t.timestamps
    end
  end
end
