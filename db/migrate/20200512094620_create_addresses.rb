class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user       , null: false, foreign_key: true
      t.integer    :postal_code, null: false
      t.string     :prefecture , null: false
      t.string     :city       , null: false
      t.string     :address     , null: false
      t.string     :apartment_name
      t.timestamps
    end
  end
end
