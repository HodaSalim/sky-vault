class WorkspacesController < ApplicationController
  before_action :authenticate_user!

  def index
    @workspaces = current_user.workspaces
  end

  def create
    @workspace = current_user.workspaces.build(workspace_params)
    if @workspace.save
      flash[:success] = "Workspace created"
      redirect_to root_url
    else
      flash[:error] = "Workspace creation failed"
    end
  end

  def destroy
    @workspace = current_user.workspaces.find_by(id: params[:id])
    @workspace.destroy
    flash[:success] = "workspace is deleted"
    redirect_to root_url
  end

  private

  def workspace_params
    params.require(:workspace).permit(:name, :is_shared)
  end
end
