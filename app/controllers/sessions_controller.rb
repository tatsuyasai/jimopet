class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      log_in user
      redirect_to pets_path, success: 'ログインしました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end
    
  private
  def log_in(user)
      session[:user_id] = user.id #sessionで暗号化して保存
  end
  
  def log_out
    session.delete(:user_id) #sessionにあるuser_id削除
    @current_user = nil #ユーザー情報削除
  end
  
  def session_params
    params.require(:session).permit(:email, :password)#sessionのemailとパスワードのみ受け取る
  end
end
