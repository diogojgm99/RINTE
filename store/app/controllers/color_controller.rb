class ColorController < ApplicationController
    def index
        @colors = Color.all
    end

    def show
        @colors = Color.find(params[:id])
    end

    def new
        @colors = Color.new
    end

    def create
        @colors = Color.new(name: "...", flag_deleted: false)
    
        if @colors.save
            redirect_to @colors
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @colors = Color.find(params[:id])
      end
    
    def update
        @colors = Color.find(params[:id])

        if @colors.update(color_params)
            redirect_to @colors
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @colors = Color.find(params[:id])
        @colors.destroy
    
        redirect_to root_path, status: :see_other
    end

    private
        def color_params
            params.require(:color).permit(:name)
        end
end
