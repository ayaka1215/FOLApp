class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def show
        # ユーザー詳細
        @user = User.find(params[:id])
    end

    def me
        @user = User.find(current_user.id)
    end
end
