class ReservationsController < ApplicationController
    def index
        @reservation = Reservation.all
    end
    def create
        # できていない
        reservation = Reservation.new(reservation_params)
        # paramsでuser_idが渡ってこない。hiddenで設定してもだめ
        reservation.user_id = current_user.id 
        if reservation.save
            flash[:notice] = "「イベントを予約しました。」"
            redirect_to events_path
        else
            flash[:notice] = reservation.errors.full_messages
            redirect_to events_path
        end
    end

    private

    def reservation_params
        params.permit(:event_id, :user_id)
    end
end