class AlbumsController < ApplicationController
  #Callback methods
  before_action :confirm_logged_in
  before_action :set_album, :only=>[:show, :edit, :update, :delete, :destroy]
  before_action :set_artists_and_features,:only=>[:new,:edit,:create,:update]
  # GET /albums
  def index
    @albums = Album.all 
  end

  # GET /albums/1
  def show
  end

  # GET /albums/new
  def new
    @album = Album.new
  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums
  def create
    @album = Album.new(album_params)
    @checked_features=params[:feature_list] || []
    for feature_id in @checked_features
      feature=Feature.find(feature_id.to_i)
      @album.features << feature     
    end

    if @album.save
      flash[:notice]= 'Album was successfully created.'
      redirect_to(albums_path)
    else            
      render('new')      
    end
  end

  # PATCH/PUT /albums/1
  def update
    checked_params=params[:feature_list] || []
    checked_features = []
    
    for feature_id in checked_params
      feature=Feature.find(feature_id.to_i)
      unless @album.features.include?(feature)
        @album.features << feature
      end
      checked_features << feature
    end
    
    missing_features=@features - checked_features
    
    for feature in missing_features
      if @album.features.include?(feature)
        @album.features.delete(feature)
      end
    end 

    if @album.update_attributes(album_params)
      flash[:notice]= 'Album was successfully updated.'
      redirect_to(album_path(@album.id))       
    else
      render('edit')
    
    end
  end

  # DELETE /albums/1
  def delete
  end

  def destroy
    @album.destroy
    flash[:notice]= 'Album was successfully deleted.' 
    redirect_to(albums_path)
  end

  private #-------------------------------------------------------------
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    def set_artists_and_features
      @artists=Artist.all   ||= []
      @features=Feature.all ||= []
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      #params[:album]
      params.require(:album).permit(:title,:release_date,:price,:genre,
        :image_path,:artist_id)
    end
end
