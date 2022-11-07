class EventsController < ApplicationController
    before_action :set_target_event, only: %i[show edit update destroy]

    def index
        @events = Event.all
    end

    def new
        @event = Event.new(flash[:event])
    end

    def create
        event = Event.new(event_params)
        if event.save
            flash[:notice] = "「#{event.title}」の掲示板を作成しました。"
            redirect_to events_path
        else
            redirect_to :back, flash: {
                event: event,
                erro_messages: event.errors.full_messages
            }
        end
    end

    def show
    end

    private

    def event_params
        # TODO：FORM整えたらカラム増やす
        params.require(:event).permit(:title, :content)
    end

    def set_target_event
        @event = Event.find(params[:id])
    end
end
