class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
  @user = current_user
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
  
  def edit
    @user = current_user
  end
  
  def update
    @user = User.find(params[:id])#空のモデルを用意だと新規作成になり修正ではない
    @user.update(params.require(:user).permit(:name, :email, :password, :password_confirmation))
    
    if @user.save
      redirect_to user_path(current_user.id), success: '編集しました'
    else
      flash.now[:danger] = "編集に失敗しました"
      render :edit
    end
  end
  
  def destroy 
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to("/")#トップへ
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)#userのnameとemailとパスワードのみ受け取る
  end
end
