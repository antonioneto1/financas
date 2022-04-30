class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :pass
      t.string :phone
      t.string :document
      t.string :age
      t.float :income
      t.string :token
      t.integer :spendings_ids

      t.timestamps
    end
  end
end
