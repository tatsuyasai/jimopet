class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :danger
  
  helper_method :current_user, :logged_in? #ApplicationHelperでも使える
  
  def current_user　#ログインしているユーザーを返す
    @current_user ||= User.find_by(id: session[:user_id]) #とにかく省略形
  end
  
  def logged_in? #ログインしているか確認
    !current_user.nil?
  end
end
