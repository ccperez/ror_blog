class PostsController < ApplicationController
	before_action :get_post, except: [:index, :create]
  before_action :authenticate_user!, except: [:index, :show]

  def index
  	@posts = Post.order("created_at desc").paginate(page: params[:page], per_page: 10)
  end

  def show
    redirect_to @post, status: :moved_permanently if request.path != post_path(@post)
  end

  def new
  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
  		redirect_to @post, notice: "Hellz yeah, Makenzie! Your article was successfully saved!"
  	else
  		render new, notice: "Oh no Mackenzie! I was unable to save your post."
  	end
  end

  def edit
  end

  def update
  	if @post.update(post_params)
  		redirect_to @post, notice: "Huzzah, Your article was successfully saved!"
  	else
			render edit	
  	end
  end

  def destroy
  	@post.destroy
  	redirect_to posts_path, notice: "Deleted"
  end

  private #-
  	def post_params
  		params.require(:post).permit(:title, :content, :slug)
  	end

  	def get_post
      @post = get_object(params[:id], Post)
  	end
end