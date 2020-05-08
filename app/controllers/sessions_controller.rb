class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email]) #メールアドレスを取得し、一致するユーザーがいるか検索
    if user && user.authenticate(params[:session][:password]) #該当のメールアドレスをもつuserが存在している。かつuserのパスワードが正しい
      log_in user　#private参照
   　  redirect_to root_path, success: "ログインしました"
    else
       flash.now[:danger] = "ログインに失敗しました"
       render :new
    end
  end
    
  private
  def log_in(user)
      session[:user_id] = user.id #sessionで暗号化して保存
  end
end
