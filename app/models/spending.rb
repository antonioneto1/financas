class Spending < ApplicationRecord
  belongs_to :user

  validates :name, presence: {:message => "O nome do Usuario é obrigatório"}
  validates :value, presence: {:message => "O email de cadastro é obrigatório"}
  validates :spending_type, presence: {:message => "A idade é obrigatório"}
  validates :date, presence: {:message => "O documento de cadastro é obrigatório"}

  enum spending_type: { essential: 0, leisure: 1, unforeseen: 2 }
  enum competence: { 
    January: 0, 
    February: 1, 
    March: 2 ,
    april: 3,
    may: 4,
    june: 5,
    july: 6,
    august: 7,
    september: 8,
    october: 9,
    november: 10,
    december: 11,
  }


  def month_of_competence
    self.competence = date.month if date.present?
  end


  def spending_display
    {"Nome: #{name}, Valor: #{value}, Data: #{date}, Tipo: #{spending_type} }
  end
end
