class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.find(current_user.id)
    @groups = Group.where(user_id: @user.id).includes(:entities)
  end

  def show
    @user = current_user
    @group = Group.find(params[:id])
    @entities = @group.entities.order('created_at DESC')
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
