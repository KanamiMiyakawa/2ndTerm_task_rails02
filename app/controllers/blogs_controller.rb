class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:index, :show, :new, :edit]
  def index
    @blogs = Blog.all.order("id DESC")
    @blog = Blog.new
  end

  def show
  end

  def confirm
    @blog = current_user.blogs.build(blog_params)
    @blogs = Blog.all.order("id DESC")
    render :index if @blog.invalid?
  end

  def edit
  end

  def create
    @blogs = Blog.all.order("id DESC")
    @blog = current_user.blogs.build(blog_params)
    if params[:back]
      binding.irb
      render :index
    else
      if @blog.save
        redirect_to @blog, notice: 'Blog was successfully created.'
      else
        render :new
      end
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to @blog, notice: 'Blog was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_url, notice: 'Blog was successfully destroyed.'
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :content, :image, :image_cache, :user_id)
  end
end
