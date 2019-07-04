class UsersController < ApplicationController
  before_action :authorize, except: [:new, :create]
  before_action :correct_user?, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:edit, :show, :update, :destroy]

  def show
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.create_user
      sign_in(@user)
      redirect_to sign_in_path, notice: "Usuário foi criado com sucesso!"
    else 
      render action: :new
    end
  end

  def edit
  end
  
  def update
    if @user.update_user(params[:user][:name], params[:user][:email], params[:user][:city], params[:user][:street], params[:user][:age], params[:user][:profile_pic], @user.id)
      redirect_to user_path(@user.id)
    else
      render action: :edit
    end
  end
  
  def destroy
    @user.delete_user(@user.id)
    sign_out
    redirect_to root_path
  end

  private
  
    def set_user
      @user = User.new().find_user(params[:id]) 
    end

    def user_params
      params.require(:user).permit(:name, :email, :profile_pic, :city, :street, :age, :password, :password_confirmation)
    end

end
