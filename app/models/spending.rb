class Spending < ApplicationRecord
  belongs_to :user

  validates :name, presence: {:message => "O nome do Usuario é obrigatório"}
  validates :value, presence: {:message => "O email de cadastro é obrigatório"}
  validates :spending_type, presence: {:message => "A idade é obrigatório"}
  validates :date, presence: {:message => "O documento de cadastro é obrigatório"}

  enum spending_type: { essential: 0, leisure: 1, unforeseen: 2 }
end
