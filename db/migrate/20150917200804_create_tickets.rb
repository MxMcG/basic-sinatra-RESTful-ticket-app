class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :artist
      t.string :date
      t.string :location
      t.string :time
      t.string :price
      t.references :user

      t.timestamps
    end
  end
end
