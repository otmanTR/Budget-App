class GroupsController < ApplicationController
    def index
      @user = User.find(current_user.id)
      @groups = @user.groups
    end
  
    def new
      @group = Group.new
    end
  
    def create
      @group = current_user.groups.new(group_params)
      @group.user = current_user
  
      if @group.save
        flash[:success] = 'group created successfully.'
        redirect_to '/groups'
      else
        flash[:danger] = 'group could not be created.'
        render :new
      end
    end
  
    def destroy
      @group = group.find(params[:id])
      @group.destroy!
      flash[:notice] = 'group has been successfully deleted!'
      redirect_to groups_path
    end
  
    private
  
    def group_params
      params.require(:group).permit(:name, :icon)
    end
  end