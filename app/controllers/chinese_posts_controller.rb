class ChinesePostsController < ApplicationController
  before_action :set_chinese_post, only: [:show, :edit, :update, :destroy]

  $translator = Yandex::Translator.new('trnsl.1.1.20171201T174723Z.ad1f067b0544dfc6.326ee4f45e33241a8a265b8d3424728de10618d4')
  # GET /chinese_posts
  # GET /chinese_posts.json

  def index
    @chinese_posts = ChinesePost.all
    authorize @chinese_posts
  end

  # GET /chinese_posts/1
  # GET /chinese_posts/1.json
  def show
    @chinese_phrases = @chinese_post.chinese_phrases
    authorize @chinese_post
    @vietnamese_phrase = VietnamesePhrase.new()
  end

  # GET /chinese_posts/new
  def new
    @chinese_post = ChinesePost.new
    authorize @chinese_post
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
        split_phrases(@chinese_post.content)
        create_phrases(@phrases)
      else
        format.html { render :new }
        format.json { render json: @chinese_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def split_phrases post
    @phrases = post.split("。")
  end

  def create_phrases phrases
    @phrases.each do |phrase|
      zh_phrase = ChinesePhrase.new(content: phrase, chinese_post_id: @chinese_post.id)
      zh_phrase.save
      translate_zh_to_vi(zh_phrase)
    end
  end

  def translate_zh_to_vi zh_phrase
      vi_phrase_translated = $translator.translate(zh_phrase.content, from: 'zh', to: 'vi')
      vi_phrase = VietnamesePhrase.new(content: vi_phrase_translated, chinese_phrase_id: zh_phrase.id )
      vi_phrase.save
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
      params.require(:chinese_post).permit(:title, :content, :image, :source, :admin_id)
    end

  def user_not_authorized
    flash[:alert] = "Please Sign in FIRST - just an ez step :)"
    redirect_to(new_user_session_path)
  end
end
