class PanjabiWordsController < ApplicationController
  before_action :set_panjabi_word, only: [:show, :edit, :update, :destroy]

  # GET /panjabi_words
  # GET /panjabi_words.json
  def index
	@panjabi_words = PanjabiWord.all
  end

  # GET /panjabi_words/1
  # GET /panjabi_words/1.json
  def show
  end

  # GET /panjabi_words/new
  def new
	@panjabi_word = current_user.panjabi_words.build
  end

  # GET /panjabi_words/1/edit
  def edit
  end

  # POST /panjabi_words
  # POST /panjabi_words.json
  def create
	@panjabi_word = current_user.panjabi_words.new()

    @panjabi_word.gurmukhi  = panjabi_word_params[:gurmukhi]
    @panjabi_word.shahmukhi = panjabi_word_params[:shahmukhi]
    @panjabi_word.roman     = panjabi_word_params[:roman]
    @panjabi_word.phonetics = panjabi_word_params[:phonetics]
    @panjabi_word.anuvaad   = panjabi_word_params[:anuvaad]
    @panjabi_word.usage     = panjabi_word_params[:usage]
    @panjabi_word.pos       = Global::Vars::POS.find_index(panjabi_word_params[:pos])
    @panjabi_word.score     = 0
    @panjabi_word.approved  = false

    @panjabi_word.save

    @translation = @panjabi_word.translations.new()
    @translation.language_id =  Global::Vars::LANGUAGES.find_index(panjabi_word_params[:translation_language_id])
    @translation.meaning = panjabi_word_params[:translation_meaning]
    @translation.usage = panjabi_word_params[:translation_usage]

	respond_to do |format|
	  if @translation.save
		format.html { redirect_to submissions_url, notice: 'Panjabi word was successfully created.' }
		format.json { render :show, status: :created, location: @panjabi_word }
	  else
		format.html { render :new }
		format.json { render json: @panjabi_word.errors, status: :unprocessable_entity }
	  end
	end
  end

  # PATCH/PUT /panjabi_words/1
  # PATCH/PUT /panjabi_words/1.json
  def update
	respond_to do |format|
	  if @panjabi_word.update(panjabi_word_params)
		format.html { redirect_to @panjabi_word, notice: 'Panjabi word was successfully updated.' }
		format.json { render :show, status: :ok, location: @panjabi_word }
	  else
		format.html { render :edit }
		format.json { render json: @panjabi_word.errors, status: :unprocessable_entity }
	  end
	end
  end

  # DELETE /panjabi_words/1
  # DELETE /panjabi_words/1.json
  def destroy
    @panjabi_word.translations.destroy_all
	@panjabi_word.destroy
	respond_to do |format|
	  format.html { redirect_to submissions_url, notice: 'Panjabi word was successfully destroyed.' }
	  format.json { head :no_content }
	end
  end

  def search
	if params[:search].blank?
	  redirect_to(root_path, alert: "Empty field!") and return
	else
	  @parameter = params[:search].downcase
      @results = PanjabiWord.all.where("lower(gurmukhi) LIKE :search", search: "#@parameter%")
      if @results.empty?
        redirect_to(root_path, notice: "No Results Found") and return
      end
	end
  end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_panjabi_word
	  @panjabi_word = PanjabiWord.find(params[:id])
	end

	# Only allow a list of trusted parameters through.
	def panjabi_word_params
	  params.require(:panjabi_word).permit(:gurmukhi, :shahmukhi, :roman, :phonetics, :anuvaad, :usage, :pos, :score, :approved, :translation_usage, :translation_meaning, :translation_language_id)
	end
  end
