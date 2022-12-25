class GroupController < ApplicationController
    
    def create
        @admin = Group.find_by(user_id: current_user.id, project_id: params[:project_id])
        if not @admin.is_admin
            flash[:alert] = "You don't have permission"
            return redirect_to project_path(params[:project_id])
        end
        @group = Group.find_by(user_id: group_params[:user_id], project_id: group_params[:project_id])
        if not @group.nil?
            flash[:error] = "User with this project already exists!"
            return redirect_to project_path(params[:project_id])
        end

        @group = Group.new(group_params)

        respond_to do |format|
            if @group.save
                flash[:alert] = "Succesfully created group!"
                return redirect_to project_path(params[:project_id])
            else
                flash[:error] = "Error when created group!"
                return redirect_to project_path(params[:project_id])
            end
        end
    end

    def update
        @group = Group.find(params[:id])
        @group.update(is_admin: group_params[:is_admin] == "1")
        redirect_to project_path(params[:project_id])
    end

    def destroy
        Group.delete_by(user_id: params[:id], project_id: params[:project_id])
        redirect_to request.referer
    end

    private
    def group_params
        params.require(:groups).permit(:user_id, :project_id, :is_admin)
    end
end
