class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy spending]
  skip_before_action :verify_authenticity_token

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def spending
    if @user.spending_ids?
      response = @user.spendings.spending_display.order(date: :desc)
      return render json: response, status: 200
    else
      return render json: [], status: 200
    end
  end

  def clear_spending
    if @user.spendings.any?
      response = @user.spendings.destroy
      return render json: response, status: 200
    else
      return render json: [], status: 200
    end
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        return render json: {message: "Usuario Cadastrado com sucesso"}, status: 200
      else
        erro = @user.errors.present? ? @user.errors.messages : "Erro Ao tentar cadastrar o usuario"
        return render :json => {message: erro}, status: 400
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        return render json: {message: "Usuario Atualizado com sucesso"}, status: 200
      else
        return render :json => {message: "Erro Ao tentar atualizar o usuario"}, status: 400
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      return render json: {message: "Usuario apagado com sucesso"}, status: 200
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :pass, :phone, :document, :age, :income, :token)
    end
end
