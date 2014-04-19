class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name
    	t.string :telephone
    	t.string :email
    	t.string :password_digest

      t.timestamps
   end

    create_table :restaurants do |t|
    	t.string :name
    	t.text :description
    	t.integer :capacity
    	

    	t.timestamps
    end

  end
end
