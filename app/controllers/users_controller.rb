class UsersController < ApplicationController
    # TODO：対象アクション要確認
    before_action :is_admin, only: %i[index show]
    def index
        # ユーザー一覧
        @users = User.all
    end

    def show
        # ユーザー詳細
        @user = User.find(params[:id])
    end

    def me
        # マイページ
        @user = User.find(current_user.id)
    end

    def my_reservation
        @reservation = Reservation.find_by(user_id: current_user.id)
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
