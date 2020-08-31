class ArtistInstrumentsController < ApplicationController

    def new
        @artist_instrument = ArtistInstrument.new
    end

    def create
        @artist_instrument = ArtistInstrument.create(artist_instrument_params)
        redirect_to artist_path(@artist_instrument.artist)
    end

    def destroy
        @ai = get_ai
        @ai.destroy
        redirect_to artists_path
    end

    private

    def get_ai
        ArtistInstrument.find(params[:id])
    end

    def artist_instrument_params
        params.require(:artist_instrument).permit(:artist_id, :instrument_id)
    end

end
