class MaterialController < ApplicationController
    def index
        @materials = Material.all
    end

    def show
        @material = Material.find(params[:id])
    end

    def new
        @material = Material.new
    end

    def create
        @material = Material.new(name: "...", flag_deleted: false)
    
        if @material.save
            redirect_to @material
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @material = Material.find(params[:id])
      end
    
    def update
        @material = Material.find(params[:id])

        if @material.update(material_params)
            redirect_to @material
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @material = Material.find(params[:id])
        @material.destroy
    
        redirect_to root_path, status: :see_other
    end

    private
        def material_params
            params.require(:material).permit(:name)
        end
end
