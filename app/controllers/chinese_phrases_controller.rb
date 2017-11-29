class ChinesePhrasesController < ApplicationController
  before_action :set_chinese_phrase, only: [:show, :edit, :update, :destroy]

  # GET /chinese_phrases
  # GET /chinese_phrases.json
  def index
    byebug
    @chinese_phrases = ChinesePhrase.all
  end

  # GET /chinese_phrases/1
  # GET /chinese_phrases/1.json
  def show
  end

  # GET /chinese_phrases/new
  def new
    @chinese_phrase = ChinesePhrase.new
  end

  # GET /chinese_phrases/1/edit
  def edit
  end

  # POST /chinese_phrases
  # POST /chinese_phrases.json
  def create
    @chinese_phrase = ChinesePhrase.new(chinese_phrase_params)

    respond_to do |format|
      if @chinese_phrase.save
        format.html { redirect_to @chinese_phrase, notice: 'Chinese phrase was successfully created.' }
        format.json { render :show, status: :created, location: @chinese_phrase }
      else
        format.html { render :new }
        format.json { render json: @chinese_phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chinese_phrases/1
  # PATCH/PUT /chinese_phrases/1.json
  def update
    respond_to do |format|
      if @chinese_phrase.update(chinese_phrase_params)
        format.html { redirect_to @chinese_phrase, notice: 'Chinese phrase was successfully updated.' }
        format.json { render :show, status: :ok, location: @chinese_phrase }
      else
        format.html { render :edit }
        format.json { render json: @chinese_phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chinese_phrases/1
  # DELETE /chinese_phrases/1.json
  def destroy
    @chinese_phrase.destroy
    respond_to do |format|
      format.html { redirect_to chinese_phrases_url, notice: 'Chinese phrase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chinese_phrase
      @chinese_phrase = ChinesePhrase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chinese_phrase_params
      params.require(:chinese_phrase).permit(:content)
    end
end
