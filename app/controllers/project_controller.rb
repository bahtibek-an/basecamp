class ProjectController < ApplicationController
    before_action :authenticate_user!

    def index 
        @projects = current_user.projects
    end

    def show
        @project = current_user.projects.find(params[:id])
        @all_users = [*User.all].delete_if { |user| user.id == current_user.id }
        @users = [*@project.user.select("*", "is_admin")].delete_if { |user| user.user_id == current_user.id }
        @group = @project.groups.find_by(user_id: current_user.id)
    end
    
    def create
        @project = Project.new(project_params)
        @error = @project.save
        @group = Group.create(user_id: current_user.id, project_id: @project.id, is_admin: true)

        respond_to do |format|
            if @error
                format.html { redirect_to project_url(@project), notice: "Project was successfully created." }
                format.json { render :show, status: :created, location: @project }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @project.errors, status: :unprocessable_entity }
            end
        end
    end

    def edit
        @project = Project.find(params[:id])
    end

    def update
        @project = Project.find(params[:id])
        @project.update(project_params)
        redirect_to project_url(@project)
    end

    def destroy
        @is_admin = Group.find_by(user_id: current_user.id, project_id: params[:id])
        if not @is_admin.is_admin
            @group = Group.destroy_by(user_id: current_user.id, project_id: params[:id])
            return redirect_to project_index_path
        end
        @group = Group.destroy_by(project_id: params[:id])
        @project = Project.destroy(params[:id])
        @project.destroy()
        redirect_to project_index_path
    end


    private
    def project_params
        params.require(:project).permit(:title, :description)
    end

end
