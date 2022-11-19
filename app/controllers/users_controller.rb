class UsersController < ApplicationController
    # TODO：対象アクション要確認
    before_action :set_target_user, only: %i[show edit update]
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

    def edit
    end

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
        params.require(:user).permit(:name, :profile, tag_ids: [])
    end

    def set_target_user
        @user = User.find(current_user.id)
    end
    
    def is_admin
        unless current_user.admin
            redirect_to events_path
        end
    end
end
