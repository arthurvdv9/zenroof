class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show]

  def index
    @tickets = current_user.tickets
  end

  def show
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
    redirect_to tickets_path
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:title, :description, :status, :priority, photos: [])
  end

end
