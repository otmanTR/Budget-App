class EntitiesController < ApplicationController
    def index
        @group = Group.find(params[:group_id])
        @entities = @group.entities
    end

    def new
        @entity = Entitiy.new
    end

    def create
        @entitiy = group.entitiys.new(entitiy_params)
        @entitiy.group = group
        @entitiy.author_id = current_user.id
    
        if @entitiy.save
          flash[:success] = 'entitiy created successfully.'
          redirect_to 
        else
          flash[:danger] = 'entitiy could not be created.'
          render :new
        end
      end

      private
  
    def entitiy_params
      params.require(:entitiy).permit(:name, :amount)
    end
  end