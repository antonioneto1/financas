class SpendingController < ApplicationController
  before_action :set_spending, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /spending or /spending.json
  def index
    spendings = Spending.all
  end

  # GET /spending/1 or /spending/1.json
  def show
  end

  # GET /spending/new
  def new
    spending = Spending.new
  end

  # GET /spending/1/edit
  def edit
  end

  # POST /spending or /spending.json
  def create
    spending = Spending.new(spending_params)

    respond_to do |format|
      if spending.save
        return render json: {message: "Gasto Cadastrado com sucesso"}, status: 200
      else
        erro = spending.errors.present? ? spending.errors.messages : "Erro Ao tentar cadastrar um gasto"
        return render :json => {message: erro}, status: 400
      end
    end
  end

  # PATCH/PUT /spending/1 or /spending/1.json
  def update
    respond_to do |format|
      if spending.update(user_params)
        return render json: {message: "Gasto Atualizado com sucesso"}, status: 200
      else
        return render :json => {message: "Erro Ao tentar atualizar"}, status: 400
      end
    end
  end

  # DELETE /spending/1 or /spending/1.json
  def destroy
    @spending.destroy

    respond_to do |format|
      return render json: {message: "Apagado com sucesso"}, status: 200
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spending
      spending = Spending.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def spending_params
      params.require(:spending).permit(:name, :user_id, :value, :description, :spending_type, :date)
    end
end
