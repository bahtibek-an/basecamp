class HomeController < ApplicationController
    before_action :check_signed_in

    def check_signed_in
        redirect_to project_index_path if signed_in?
    end
end
