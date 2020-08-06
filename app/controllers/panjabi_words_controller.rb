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
	@panjabi_word = current_user.panjabi_words.build(panjabi_word_params)
    @panjabi_word[:score]=0
    @panjabi_word.save

    @translation = @panjabi_word.translations.new()
    byebug
	respond_to do |format|
	  if @translation.save
		format.html { redirect_to @panjabi_word, notice: 'Panjabi word was successfully created.' }
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
	@panjabi_word.destroy
	respond_to do |format|
	  format.html { redirect_to panjabi_words_url, notice: 'Panjabi word was successfully destroyed.' }
	  format.json { head :no_content }
	end
  end

  def search
	if params[:search].blank?
	  redirect_to(root_path, alert: "Empty field!") and return
	else
	  @parameter = params[:search].downcase
	  @results = PanjabiWord.all.where("lower(gurmukhi) LIKE :search", search: "#@parameter%")
	end
  end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_panjabi_word
	  @panjabi_word = PanjabiWord.find(params[:id])
	end

	# Only allow a list of trusted parameters through.
	def panjabi_word_params
	  params.require(:panjabi_word).permit(:gurmukhi, :shahmukhi, :roman, :phonetics, :anuvaad, :usage, :pos, :score, :approved)
	end
  end
