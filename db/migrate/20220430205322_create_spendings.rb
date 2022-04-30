class CreateSpendings < ActiveRecord::Migration[6.1]
  def change
    create_table :spendings do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.date :date
      t.float :value
      t.integer :spending_type

      t.timestamps
    end
  end
end
