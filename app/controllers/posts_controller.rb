class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    @posts = Post.all
    if params[:search] == nil
      @posts= Post.all
    elsif params[:search] == ''
      @posts= Post.all
    else
      #部分検索
      @posts = Post.where("title LIKE ? ",'%' + params[:search] + '%')
  end
  
    
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    Rails.logger.debug "@post : #{@post.inspect}"
    post.user_id = current_user.id
    if post.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    @post = Post.find(params[:id])
    @posts = Post.all
    @comments = @post.comments
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to :action => "show", :id => post.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to action: :index
  end

  private
  def post_params
    params.require(:post).permit(:image , :title)
  end




end
