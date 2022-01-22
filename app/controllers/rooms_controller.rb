class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :introduction, :price, :address, :image, :user_id))
    if @room.save
      flash[:notice] = 'ルームを新規登録しました'
      redirect_to :rooms
    else
      flash[:error] = @room.errors.full_messages
      redirect_to :new_room
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:name, :introduction, :price, :address, :image, :user_id))
      flash[:notice] = 'ルームの情報を更新しました'
      redirect_to :rooms
    else
      flash[:error] = @room.errors.full_messages
      redirect_to :edit_room
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = 'ルームを削除しました'
    redirect_to :rooms
  end
end
