class ReservationsController < ApplicationController
    def index
        @reservations = Reservation.find_by(user_id: current_user.id)
    end

    def create
        reservation = Reservation.new(reservation_params)
        if reservation.save
            flash[:notice] = "イベント#{reservation.event.title}を予約しました。"
            redirect_to events_path
        else
            flash[:alert] = reservation.errors.full_messages
            redirect_to events_path
        end
    end

    private

    def reservation_params
        params.require(:reservation).permit(:event_id, :user_id)
    end
end