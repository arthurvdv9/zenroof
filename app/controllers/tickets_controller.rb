class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show]

  def index
    @tickets = current_user.room.tickets
    if params[:query].present?
      sql_subquery = "title ILIKE :query OR description ILIKE :query"
      @ticekts = @ticekts.where(sql_subquery, query: "%#{params[:query]}%")
  end
    end

    def show
    @ticket = Ticket.find(params[:id])
    @message = Message.new
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @room = Room.find(params[:room_id])
    @ticket = Ticket.new(ticket_params)
    @ticket.room = @room
    @ticket.status = "pending"
    if @ticket.save
      redirect_to dashboard_path
    else
      render "pages/dashboard", status: :unprocessable_entity
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to dashboard_path
  end

  def update
    @ticket = Ticket.find(params[:id])
    @ticket.update(ticket_params)
    redirect_to ticket_path(@ticket)
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:title, :description, :status, :priority, photos: [])
  end


end
