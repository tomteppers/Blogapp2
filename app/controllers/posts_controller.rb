class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  before_filter :load_blog

  def index
    @posts = @blog.posts

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  def load_blog
    @blog = Blog.find params[:blog_id]
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = @blog.posts.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = @blog.posts.build(params[:post])


    respond_to do |format|
      if @post.save
        format.html { redirect_to blog_post_path(@blog,@post), notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  def search
    term = params[:term]
    @posts = @blog.posts.where("lower(titel) like lower(?)","%#{term}%")
    render "index"
  end
end
