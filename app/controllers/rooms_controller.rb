class RoomsController < ApplicationController
  def index
    @rooms = Room.where("address LIKE ? AND name LIKE ?", "%#{params[:area]}%", "%#{params[:keyword]}%")
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

  def posts
    if current_user
      @rooms = current_user.rooms
    else
      redirect_to :new_user_session
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
    redirect_to :rooms_posts
  end
end
