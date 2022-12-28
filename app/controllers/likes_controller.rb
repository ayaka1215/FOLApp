class LikesController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]

    def create
        @like = Like.new(user_id: current_user.id, event_id: params[:format])
        @like.save
        @event = Event.find(params[:format])
        render formats: :js, layout: false
    end
    
    def destroy
        @like = Like.find_by(user_id: current_user.id, event_id: params[:id])
        @like.destroy
        @event = Event.find(params[:id])
        render formats: :js, layout: false
    end
end
