class UsersController < ApplicationController
  def index
    @users = User.paginate(page: params[:page],per_page: 5)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.create!(user_params)
    authorize :user
    if @user.save
      redirect_to users_path, notice: 'Usuário cadastrado!'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    authorize user
    
    if @user.update(user_params)
      redirect_to users_path, notice: 'Usuário atualizado!'
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :permission)
  end
end
