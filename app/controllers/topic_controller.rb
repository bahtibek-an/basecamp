class TopicController < ApplicationController
    def index
        @project = Project.find(params[:project_id])
        @topics = @project.topic
        @group = @project.groups.find_by(user_id: current_user.id)
    end

    def edit
        @topic = Topic.find(params[:id])
    end

    def create
        @group = Group.find_by(user_id: current_user.id, project_id: params[:project_id])
        if not @group.is_admin
            flash[:error] = "You don't have access to this operation!"
        end
        @topic = Project.find(params[:project_id]).topic.build(topic_params)
        if @topic.save
            flash[:alert] = "Successfully created Topic"
            redirect_to project_topic_index_path(params[:project_id])
        else
            flash[:error] = "Error #{@topic.error}"
            redirect_to project_topic_index_path(params[:project_id])
        end
    end

    def update 
        @group = Group.find_by(user_id: current_user.id, project_id: params[:project_id])
        if not @group.is_admin
            flash[:error] = "You don't have access to this operation!"
        end
        @message = Topic.find(params[:id])
        if @message.update(topic_params)
          flash[:success] = "Topic updated!"
          redirect_to project_topic_index_path(params[:project_id], params[:id])
        else
          flash.now[:error] = "Topic updated failed"
          redirect_to request.referer
        end
    end

    def destroy
        @group = Group.find_by(user_id: current_user.id, project_id: params[:project_id])
        if not @group.is_admin
            flash[:error] = "You don't have access to this operation!"
        end
        @message = Message.destroy_by(topic_id: params[:id])
        @topic = Topic.destroy(params[:id])
        redirect_to request.referer
    end

    private
    def topic_params
        params.require(:topic).permit(:title)
    end
end
