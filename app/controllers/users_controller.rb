class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :user_products, :user_reviews]

  def index
    users = User.all
    render json: users
  end

  # GET /users/:id
  def show
    render json: @user
  end

  # POST /users
  def create
    user = User.create(user_params)
    if user.save
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/:id
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    head :no_content
  end

  # Custom method to list all products of a user
  def user_products
    products = @user.products
    render json: products
  end

  # Custom method to list all reviews of a user
  
  def user_reviews
  reviews = @user.reviews
  render json: reviews
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
