class AddCompetenceToSpendings < ActiveRecord::Migration[6.1]
  def change
    add_column :spendings, :competence, :integer
  end
end
