class ArtistsController < ApplicationController

    def index
        @artists = Artist.all
    end

    def show
        @artist = get_artist
    end

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.create(artist_params)
        if @artist.valid?
            redirect_to artist_path(@artist)
        else
            flash[:my_errors] = @artist.error.full_messages
            redirect_to new_artist_path
        end
    end

    def destroy
        @artist = get_artist
        @artist.destroy
        redirect_to artists_path
    end


    private

    def get_artist
        Artist.find(params[:id])
    end

    def artist_params
        params.require(:artist).permit(:name, :age, :title)
    end

end
