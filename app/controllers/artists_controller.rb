class ArtistsController < ApplicationController
  #Callback methods
  before_action :confirm_logged_in
  before_action :set_artist, :only=>[:show, :edit, :update, :delete, :destroy]
  
  # GET /artists
  def index
    @artists = Artist.all 
  end

  # GET /artists/1
  def show
  end

  # GET /artists/new
  def new
    @artist = Artist.new
  end

  # GET /artists/1/edit
  def edit
  end

  # POST /artists
  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      flash[:notice]= 'artist was successfully created.'
      redirect_to(artists_path)
    else
      render('new')      
    end
  end

  # PATCH/PUT /artists/1
  def update
    if @artist.update_attributes(artist_params)
      flash[:notice]= 'artist was successfully updated.'
      redirect_to(artists_path(@artist.id))       
    else
      render('edit')
    end
  end

  # DELETE /artists/1
  def delete
  end

  def destroy
    @artist.destroy
    flash[:notice]= 'artist was successfully deleted.' 
    redirect_to(artists_path)
  end

  private #-------------------------------------------------------------
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_params
      #params[:artist]
      params.require(:artist).permit(:name,:active_year,:biography)
    end

end
