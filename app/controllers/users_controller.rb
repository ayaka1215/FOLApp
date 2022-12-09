class UsersController < ApplicationController
    # TODO：対象アクション要確認
    before_action :authenticate_user!
    before_action :set_me, only: %i[edit update]
    before_action :set_target_user, only: %i[show destroy]
    before_action :is_admin, only: %i[index destroy]

    def index
        @users = User.all
    end

    def me
        @user = User.find(current_user.id)
        @reservations = Reservation.where(user_id: current_user.id)
    end

    def show
    end

    def edit
    end

    # TODO：registrationコントローラに移す
    def update
        if @user.update(user_params)
            flash[:notice] = "プロフィールを修正しました。"
            redirect_to mypage_path
        else
            redirect_to mypage_path, flash: {
                user: @user,
                alert: @user.errors.full_messages
            }
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :profile, :image, part_ids: [])
    end

    def set_me
        @user = User.find(current_user.id)
    end

    def set_target_user
        @user = User.find(params[:id])
    end
    
    def is_admin
        unless current_user.admin
            redirect_to events_path
        end
    end
end
