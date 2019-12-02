class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :ciphertext
      t.string :sender_name
      t.string :receiver_name

      t.timestamps
    end
  end
end
