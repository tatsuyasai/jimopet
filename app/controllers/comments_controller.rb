class CommentsController < ApplicationController
  
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    #@comment.user_id = current_user.id
    #@comment.pet_id = params[:pet_id]
    
    if @comment.save
      redirect_to pets_path, success: 'コメントしました'
    else
      flash.now[:danger] = "コメントできませんでした"
      render :new
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to pets_path, success: '削除しました'
    
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content, :pet_id)
  end
end
