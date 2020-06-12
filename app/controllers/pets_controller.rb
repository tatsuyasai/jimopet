class PetsController < ApplicationController
  
  def index
    @pets = Pet.all.order(created_at: :desc) #新しいものから表示される
  end
  
  def new
    @pet = Pet.new
  end
  
  def create
    @pet = current_user.pets.new(pet_params)

    if @pet.save
      redirect_to pets_path, success: '投稿しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  def edit
    @pet = Pet.find(params[:id])#データベースから対象のpet_idをとる
  end
  
  def update
    @pet = Pet.find(params[:id])#空のモデルを用意だと新規作成になり修正ではない
    @pet.update(params.require(:pet).permit(:image, :description, :type, :prefecture, :city))
    
    if @pet.save
    redirect_to pets_path, success: '編集しました'
    else
      flash.now[:danger] = "項目をすべて埋めてください"
      render :edit
    end
  end
  
  def destroy
     @pet = Pet.find(params[:id])
    if @pet.user_id == current_user.id
       @pet.destroy
       redirect_to pets_path, success: '削除しました'
    end
    
  end
  
  private
  def pet_params
    params.require(:pet).permit(:image, :description, :type, :prefecture, :city)
  end
end
