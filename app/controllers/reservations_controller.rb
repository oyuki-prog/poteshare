class ReservationsController < ApplicationController
  def index
    unless current_user.nil?
      @reservations = Reservation.where(user_id: current_user.id)
    else
      redirect_to :new_user_session
    end
  end

  def new
    @request = params[:reservation]
    @reservation = Reservation.new
    @stay_days = (@request[:end_date].to_date - @request[:start_date].to_date).to_i
    @room = Room.find(@request[:room_id])
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :guests_num, :user_id, :room_id))
    if @reservation.save
      flash[:notice] = '予約ができました'
      redirect_to :reservations
    else
      flash[:error] = @reservation.errors.full_messages
      redirect_to "/rooms/#{@reservation.room_id}"
    end
  end
end
