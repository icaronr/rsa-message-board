class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :pub_key
      t.string :pvt_key

      t.timestamps
    end
    add_index :users, :username, unique: true
    add_index :users, :pub_key, unique: true
    add_index :users, :pvt_key, unique: true
  end
end
