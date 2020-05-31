class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def index
    @pets = Pet.where(user_id: current_user.id)#自分の投稿したもの
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, success: "登録しました"
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new #newアクションを写す
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)#userのnameとemailとパスワードのみ受け取る
  end
end
