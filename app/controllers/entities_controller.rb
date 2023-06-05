class EntitiesController < ApplicationController
    def index
        @group = Group.find(params[:group_id])
        @entities = @group.entities
    end

    def new
        @entity = Entity.new
    end

    def create
        @entity = current_user.entities.new(entity_params)
        @entity.group_id = params[:group_id]
        @entity.author_id = current_user.id
        @group = Group.find(params[:group_id])
    
        if @entity.save
          flash[:success] = 'entity created successfully.'
          redirect_to group_entities_path
        else
          flash[:danger] = 'entity could not be created.'
          render :new
        end
      end

      private
  
    def entity_params
      params.require(:entity).permit(:name, :amount)
    end
  end