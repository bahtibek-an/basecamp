class AttachmentsController < ApplicationController
    def index
        @project = Project.find(params[:project_id])
    end

    def create
        @project = Project.find(params[:project_id])
        @project.files.attach(attachments_params[:files])
        @project.save()
        redirect_to request.referer
    end

    def destroy
        @files = ActiveStorage::Attachment.find(params[:id])
        @files.purge
        redirect_to request.referer
    end

    private
    def attachments_params
        params.require(:attachment).permit(files: [])
    end
end
