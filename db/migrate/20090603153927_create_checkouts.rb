class CreateCheckouts < ActiveRecord::Migration
  def self.up
    create_table :checkouts do |t|
      t.references :order
      t.references :shipping_method
      t.string :email
      t.string :ip_address
      t.text :special_instructions
      t.integer :bill_address_id
      t.integer :ship_address_id
      t.timestamps
    end
    change_table :orders do |t|
      t.remove :special_instructions
    end
  end

  def self.down
    drop_table :checkouts
  end
end
