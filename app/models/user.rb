class User < ApplicationRecord
  validates :name, presence: {:message => "O nome do Usuario é obrigatório"}
  validates :email, presence: {:message => "O email de cadastro é obrigatório"}
  validates :age, presence: {:message => "A idade é obrigatório"}
  validates :document, presence: {:message => "O documento de cadastro é obrigatório"}
  validates :income, presence: {:message => "Sua renda é obrigatório"}
  validates :pass, presence: {:message => "A senha é obrigatório"}

  has_many :spendings
  
end
