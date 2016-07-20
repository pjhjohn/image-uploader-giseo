class HomeController < ApplicationController
  # View .html.erb
  def index   # /
    @posts = Post.all.reverse
  end
  
  def new     # /new
  end
  
  def detail  # /:id
    read()
  end
  
  def edit    # /:id/edit
    read()
  end
  
  def remove  # /:id/remove
  end
  
  # Database
  def create
    post = Post.new
    post.title = params[:title]
    post.content = params[:content]
    post.image = params[:image]
    post.save
    
    redirect_to "/"
  end
  
  def read
    @post = Post.find(params[:id])
  end
  
  def update
    read()
    @post.title = params[:title]
    @post.content = params[:content]
    
    redirect_to "/#{params[:id]}" # "/"+params[:id]
  end
  
  def delete
    read()
    post.destroy
    
    redirect_to "/"
  end
end
