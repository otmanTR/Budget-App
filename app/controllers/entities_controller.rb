class EntitiesController < ApplicationController

    def new
      @groups = Group.all 
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

      def destroy
        @entity = entity.find(params[:id])
        @entity.destroy!
        flash[:notice] = 'entity has been successfully deleted!'
        redirect_to group_entities_path
      end

      private
  
    def entity_params
      params.require(:entity).permit(:name, :amount)
    end
  end