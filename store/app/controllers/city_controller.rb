class CityController < ApplicationController
    def index
        @cities = City.all
    end

    def show
        @city = City.find(params[:id])
    end

    def new
        @city = City.new
    end

    def create
        @city = City.new(name: "...", flag_deleted: false)
    
        if @city.save
            redirect_to @city
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @city = City.find(params[:id])
      end
    
    def update
        @city = City.find(params[:id])

        if @city.update(city_params)
            redirect_to @city
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @city = City.find(params[:id])
        @city.destroy
    
        redirect_to root_path, status: :see_other
    end

    private
        def city_params
            params.require(:city).permit(:name)
        end
end
