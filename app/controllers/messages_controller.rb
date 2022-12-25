class MessagesController < ApplicationController

    def create
        @message = Topic.find(params[:topic_id]).message.build(message_params)
        @message[:user_id] = current_user.id

        if @message.save
            flash[:notice] = "Successfully message added!"
            redirect_to request.referer
        else
            flash[:alert] = "Failed to save"
            redirect_to request.referer
        end
    end

    def edit
        @message = Message.find(params[:id])
    end

    def update
        @message = Message.find(params[:id])
        if @message.update(message_params)
          flash[:success] = "Message updated!"
          redirect_to project_topic_path
        else
          flash.now[:error] = "Message update failed"
          redirect_to request.referer
        end
    end

    def destroy
        @message = Message.destroy(params[:id])
        redirect_to request.referer
    end

    private
    def message_params
        params.require(:message).permit(:message)
    end
end
