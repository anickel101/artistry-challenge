class InstrumentsController < ApplicationController

    def index
        @instruments = Instrument.all
    end

    def show
        @instrument = get_instrument
    end

    def new
        @instrument = Instrument.new
    end

    def create
        @instrument = Instrument.create(instrument_params)
        if @instrument.valid?
            redirect_to instrument_path(@instrument)
        else
            flash[:my_errors] = @instrument.errors.full_messages
            redirect_to new_instrument_path
        end
    end

    private

    def get_instrument
        Instrument.find(params[:id])
    end

    def instrument_params
        params.require(:instrument).permit(:name, :classification)
    end

end
