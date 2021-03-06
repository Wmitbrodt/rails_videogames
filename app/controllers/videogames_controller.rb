class VideogamesController < ApplicationController
  before_action :set_videogame, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :check_user, except: [:index, :show, :search]
  
  
  def search 
    if params[:search].present? # if the params user search is present
      @videogames = Videogame.search(params[:search]) # display related search params
    else 
      @videogames = Videogame.all # otherwise just display all the games
    end
  end

  # GET /videogames
  # GET /videogames.json
  def index
    @videogames = Videogame.all.paginate(:page => params[:page], :per_page => 8)
  end

  # GET /videogames/1
  # GET /videogames/1.json
  def show
    @reviews = Review.where(videogame_id: @videogame.id).order("created_at DESC")
    
      if @reviews.blank?
        @avg_rating = 0
      else
        @avg_rating = @reviews.average(:rating).round(2)
      end
  end

  # GET /videogames/new
  def new
    @videogame = current_user.videogames.build
  end

  # GET /videogames/1/edit
  def edit
  end

  # POST /videogames
  # POST /videogames.json
  def create
    @videogame = current_user.videogames.build(videogame_params)

    respond_to do |format|
      if @videogame.save
        format.html { redirect_to @videogame, notice: 'Videogame was successfully created.' }
        format.json { render :show, status: :created, location: @videogame }
      else
        format.html { render :new }
        format.json { render json: @videogame.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videogames/1
  # PATCH/PUT /videogames/1.json
  def update
    respond_to do |format|
      if @videogame.update(videogame_params)
        format.html { redirect_to @videogame, notice: 'Videogame was successfully updated.' }
        format.json { render :show, status: :ok, location: @videogame }
      else
        format.html { render :edit }
        format.json { render json: @videogame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videogames/1
  # DELETE /videogames/1.json
  def destroy
    @videogame.destroy
    respond_to do |format|
      format.html { redirect_to videogames_url, notice: 'Videogame was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_videogame
      @videogame = Videogame.find(params[:id])
    end

    def check_user 
      unless current_user.admin?
        redirect_to root_url, alert: "Sorry, only admins can do that"
      end
    end
        
    # Never trust parameters from the scary internet, only allow the white list through.
    def videogame_params
      params.require(:videogame).permit(:title, :description, :videogame_difficulty, :publisher, :rating, :image)
    end

end
