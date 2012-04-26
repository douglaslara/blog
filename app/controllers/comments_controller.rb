class CommentsController < ApplicationController
  
  def create
    #identifica o post de onde foi criado o comentario
    @post = Post.find(params[:post_id])
    
    #cria o comentario que foi submetido
    @comment = @post.comments.create(params[:comment]) 
    
    #depois de salvo, volta para o post onde o comentario foi feito
    #o helper post_path invoca o método show do PostController. 
    redirect_to post_path(@post)  
  end 
  
  #REST request: DELETE /post/:post_id/comments/:id
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy    
 
    redirect_to post_path(@post)
  end
end
