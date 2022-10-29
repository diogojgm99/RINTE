class CountryController < ApplicationController
    def index
        @countries = Country.all
    end

    def show
        @country = Country.find(params[:id])
    end

    def new
        @country = Country.new
    end

    def create
        @country = Country.new(name: "...", flag_deleted: false)
    
        if @country.save
            redirect_to @country
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @country = Country.find(params[:id])
      end
    
    def update
        @country = Country.find(params[:id])

        if @country.update(country_params)
            redirect_to @country
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @country = Country.find(params[:id])
        @country.destroy
    
        redirect_to root_path, status: :see_other
    end

    private
        def country_params
            params.require(:country).permit(:name)
        end
end
