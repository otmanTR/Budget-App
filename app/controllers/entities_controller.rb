class EntitiesController < ApplicationController

    def new
      @groups = Group.all
      @group = Group.find(params[:group_id])
        @entity = Entity.new
        
    end

    def create
      @entity = current_user.entities.new(entity_params)
      @entity.author_id = current_user.id
     
    
        if @entity.save
          group = Group.find(params[:entity][:group_id])
          @entity.groups << group
          flash[:success] = 'entity created successfully.'
          redirect_to group_path(id: params[:group_id])
        else
          flash[:danger] = 'entity could not be created.'
          render :new
        end
      end

      def destroy
        @entity = Entity.find(params[:id])
        @entity.destroy!
        flash[:notice] = 'entity has been successfully deleted!'
        redirect_to group_path(@entity.group_id)
      end

      private
  
    def entity_params
      params.require(:entity).permit(:name, :amount)
    end
  end