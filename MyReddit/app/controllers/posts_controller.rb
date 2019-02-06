class PostsController < ApplicationController
  before_action :require_login
  

  # def require_author
  #   redirect_to edit_post_url(@post) unless current_user.id == @post.auth_id
  # end

  
  def show
    @post = Post.find(params[:id])
  end


  def new
    @post = Post.new
  end


  def edit
    @post = Post.find(params[:id]) 
  end

 
  def create
    @post = Post.new(post_params)    
    @post.sub_id = params[:sub_id]     
    @post.auth_id = current_user.id

   if @post.save
      redirect_to sub_url(@post.sub_id)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit 
    end
  end

 
  def update
    @post = current_user.posts.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to sub_url(@post.sub_id)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to sub_url(@post.sub_id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :url, [:sub_ids]) #array of sub ids
  end

end
