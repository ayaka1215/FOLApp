class LikesController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]

    def create
        Like.create(user_id: current_user.id, event_id: params[:format])
      end
    
      def destroy
        like = Like.find_by(user_id: current_user.id, event_id: params[:id])
        like.destroy
      end
    
      private

end
