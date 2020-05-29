class FavoritesController < ApplicationController
  def index
    @favorite_pets = current_user.favorite_pets
  end
  
  def create
    favorite = Favorite.new #インスタンス生成
    favorite.user_id = current_user.id #ログインユーザー保存
    favorite.pet_id = params[:pet_id] #index.htmlのfavorites_path(pet_id: pet.id)が入る
    
    if favorite.save
      redirect_to pets_path, success: 'ほしいしました'
    else
      redirect_to pets_path, danger: 'ほしいできませんでした'
    end
  end
  
  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, pet_id: params[:pet_id])
    @favorite.destroy
    redirect_to pets_path, success: 'ほしいから削除しました'
  end
end
