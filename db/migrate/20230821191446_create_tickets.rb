class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :company
      t.datetime :departure
      t.string :from
      t.string :to
      t.integer :num_max

      t.timestamps
    end
  end
end
