class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:edit, :update, :create, :new]
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json {render json: @posts}
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.friendly.find(params[:id])
    @title = @post.title + " | The Content Market"
  end

  # GET /posts/new
  def new
    @post = Post.new
    @list = Dir['public/uploads/*']
  end

  # GET /posts/1/edit
  def edit
    @editing = true;
    @list = Dir['public/uploads/*']
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload
    uploaded_pics = params[:file] 
    time_footprint = Time.now.to_i.to_s(:number) 
    #abort uploaded_pics.inspect
    uploaded_pics.each do |index,pic|
      File.open(Rails.root.join('public', 'uploads', pic.original_filename), 'wb') do |file|
        file.write(pic.read)
        File.rename(file, 'public/uploads/' + time_footprint + pic.original_filename)
      end
    end
    files_list = Dir['public/uploads/*'].to_json 
    render json: { message: 'You have successfully uploded your images.', files_list: files_list } 
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:id, :name, :title, :content, :short_desc, :image, :tag)
    end
end
