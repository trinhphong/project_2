class ChinesePostsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :set_chinese_post, only: [:show, :edit, :update, :destroy]

  # GET /chinese_posts
  # GET /chinese_posts.json
  def index
    @chinese_posts = ChinesePost.all
  end

  # GET /chinese_posts/1
  # GET /chinese_posts/1.json
  def show
  end

  # GET /chinese_posts/new
  def new
    @chinese_post = ChinesePost.new
  end

  # GET /chinese_posts/1/edit
  def edit
  end

  # POST /chinese_posts
  # POST /chinese_posts.json
  def create
    @chinese_post = ChinesePost.new(chinese_post_params)

    respond_to do |format|
      if @chinese_post.save
        format.html { redirect_to @chinese_post, notice: 'Chinese post was successfully created.' }
        format.json { render :show, status: :created, location: @chinese_post }
      else
        format.html { render :new }
        format.json { render json: @chinese_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chinese_posts/1
  # PATCH/PUT /chinese_posts/1.json
  def update
    respond_to do |format|
      if @chinese_post.update(chinese_post_params)
        format.html { redirect_to @chinese_post, notice: 'Chinese post was successfully updated.' }
        format.json { render :show, status: :ok, location: @chinese_post }
      else
        format.html { render :edit }
        format.json { render json: @chinese_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chinese_posts/1
  # DELETE /chinese_posts/1.json
  def destroy
    @chinese_post.destroy
    respond_to do |format|
      format.html { redirect_to chinese_posts_url, notice: 'Chinese post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chinese_post
      @chinese_post = ChinesePost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chinese_post_params
      params.require(:chinese_post).permit(:title, :content, :source)
    end
end
