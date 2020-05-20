class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.pet_id = params[:pet_id]
    
    if @comment.save
      redirect_to pets_path, success: 'コメントしました'
    else
      flash.now[:danger] = "コメントできませんでした"
      render :new
    end
    
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
