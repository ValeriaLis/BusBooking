class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.bigint :card_number
      t.integer :user_id
      t.integer :ticket_id

      t.timestamps
    end
    add_index :bookings, :user_id
    add_index :bookings, :ticket_id
  end
end
