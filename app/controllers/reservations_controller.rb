class ReservationsController < ApplicationController
    def index
        @reservations = Reservation.where(user_id: current_user.id)
    end

    def create
        reservation = Reservation.new(reservation_params)
        if reservation.save
            flash[:notice] = "イベント#{reservation.event.title}を予約しました。"
            redirect_to events_path
        else
            redirect_to events_path, flash: {
                reservation: reservation,
                alert: reservation.errors.full_messages
            }
        end
    end

    def destroy
        reservation = Reservation.find(params[:id])
       if reservation.destroy
        flash[:notice] = "イベント#{reservation.event.title}の予約を取り消しました。"
        redirect_to event_path        
       else
        redirect_to events_path, flash: {
            reservation: reservation,
            alert: reservation.errors.full_messages
        }
       end        
    end

    private

    def reservation_params
        params.require(:reservation).permit(:event_id, :user_id)
    end
end