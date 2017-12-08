class VietnamesePhrasesController < ApplicationController
  before_action :set_vietnamese_phrase, only: [:show, :edit, :update, :destroy]

  # GET /vietnamese_phrases
  # GET /vietnamese_phrases.json
  def index
    @vietnamese_phrases = VietnamesePhrase.all
  end

  # GET /vietnamese_phrases/1
  # GET /vietnamese_phrases/1.json
  def show
  end

  # GET /vietnamese_phrases/new
  def new
    @vietnamese_phrase = VietnamesePhrase.new
  end

  # GET /vietnamese_phrases/1/edit
  def edit
  end

  # POST /vietnamese_phrases
  # POST /vietnamese_phrases.json
  def create
    @vietnamese_phrase = VietnamesePhrase.new(vietnamese_phrase_params)

    respond_to do |format|
      if @vietnamese_phrase.save
        format.html { redirect_to @vietnamese_phrase, notice: 'Vietnamese phrase was successfully created.' }
        format.json { render :show, status: :created, location: @vietnamese_phrase }
      else
        format.html { render :new }
        format.json { render json: @vietnamese_phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vietnamese_phrases/1
  # PATCH/PUT /vietnamese_phrases/1.json
  def update
    respond_to do |format|
      if @vietnamese_phrase.update(vietnamese_phrase_params)
        format.html { redirect_to @vietnamese_phrase, notice: 'Vietnamese phrase was successfully updated.' }
        format.json { render :show, status: :ok, location: @vietnamese_phrase }
      else
        format.html { render :edit }
        format.json { render json: @vietnamese_phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vietnamese_phrases/1
  # DELETE /vietnamese_phrases/1.json
  def destroy
    @vietnamese_phrase.destroy
    respond_to do |format|
      format.html { redirect_to vietnamese_phrases_url, notice: 'Vietnamese phrase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def calculate_score
    current_user.rates.create(vietnamese_phrase_id: params[:vn_id], score: params[:score], rated: true)

    vietnamese_phrase = VietnamesePhrase.find(params[:vn_id])
    total = 0;
    vietnamese_phrase.rates.each do |rate|
      total = total + rate.score
    end

    avg = total / vietnamese_phrase.rates.count

    avg_rounded = (avg * 2).round / 2.0

    vietnamese_phrase.update(score: avg_rounded)

    respond_to do |format|
      format.json { render :json => {avg: avg_rounded, vn_id: params[:vn_id]}}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vietnamese_phrase
      @vietnamese_phrase = VietnamesePhrase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vietnamese_phrase_params
      params.fetch(:vietnamese_phrase, {})
    end
end
