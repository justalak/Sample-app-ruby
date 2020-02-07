class PostController < ApplicationController
  protect_from_forgery prepend: true

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    puts ""
    puts @post.created_at
    puts ""
    puts "Hello"
  end

  def create
    @post = Post.new(post_params)
    print @post
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post }
        puts @post
        format.json { render :show, status: :ok }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to "/" }
    end
  end

  private

  def post_params
    params.permit(:title, :content)
  end
end
