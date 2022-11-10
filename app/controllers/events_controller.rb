class EventsController < ApplicationController
    before_action :set_target_event, only: %i[show]

    def index
        @events = Event.all
    end

    def new
        @event = Event.new(flash[:event])
    end

    def create
        event = Event.new(event_params)
        if event.save
            flash[:notice] = "「#{event.title}」のイベントを作成しました。"
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

    def edit
    end

    def update
        if @event.update(event_params)
            redirect_to @event
        else
            redirect_to back, flash: {
                event: @event,
                error_messages: @event.errors.full_messages
            }
        end
    end

    def destroy
       @event.destroy
       redirect_to event_path, flash: { notice: "「#{@event.title}のイベントを削除しました」" }
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
