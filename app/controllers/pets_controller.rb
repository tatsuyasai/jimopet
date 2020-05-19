class PetsController < ApplicationController
  def index
    @pets = Pet.all
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
