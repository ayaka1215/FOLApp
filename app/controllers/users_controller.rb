class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def show
        # マイページ
        @user = User.find(params[:id])
    end
end
