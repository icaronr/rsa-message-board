class CreatePublicKeys < ActiveRecord::Migration[6.0]
  def change
    create_table :public_keys do |t|
      t.string :key
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :public_keys, :key, unique: true
  end
end
