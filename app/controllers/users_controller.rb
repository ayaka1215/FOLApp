class UsersController < ApplicationController
    # TODO：対象アクション要確認
    before_action :is_admin, only: %i[index]
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

    # def edit
        
    # end

    # def destroy
        
    # end

    private
    
    def is_admin
        unless current_user.admin
            redirect_to events_path
        end
    end
end
