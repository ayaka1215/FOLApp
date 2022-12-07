class EventsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_target_event, only: %i[show edit update destroy]
    before_action :is_admin, only: %i[new create edit update destroy]

    def index
        today = Date.today
        @events = Event.where(date: today..).order(created_at: "DESC")
        @past_events = Event.where(date: ..today).order(created_at: "DESC")
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
            redirect_to new_event_path, flash: {
                event: event,
                valid_alert: event.errors.full_messages
            }
        end
    end

    def show
        @reserved = Reservation.where(event_id: @event.id)
        @reservation = Reservation.new(event_id: @event.id)

        @reserved_flg = @reserved.find_by(user_id: current_user.id)
    end

    def edit
        @event.attributes = flash[:event] if flash[:event]
    end

    def update
        if @event.update(event_params)
            flash[:notice] = "「#{@event.title}」のイベントを編集しました。"
            redirect_to @event
        else
            redirect_to edit_event_path, flash: {
                event: @event,
                alert: @event.errors.full_messages
            }
        end
    end

    def destroy
       @event.destroy
       redirect_to event_path, flash: { notice: "「#{@event.title}のイベントを削除しました」" }
    end

    private

    def event_params
        params.require(:event).permit(:title, :content, :date, :start_time, :end_time, :place, :image, :remove_image)
    end

    def set_target_event
        @event = Event.find(params[:id])
    end

    def is_admin
        unless current_user.admin
            redirect_to events_path
        end
    end
end
