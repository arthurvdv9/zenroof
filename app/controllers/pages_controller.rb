class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]


  def home
  end

  def dashboard
    @houses = House.where(user_id: current_user)
    if params[:query].present?
      sql_subquery = "name ILIKE :query OR address ILIKE :query"
      @houses = @houses.where(sql_subquery, query: "%#{params[:query]}%")
    end
    @ticket = Ticket.new
    if params[:query].present?

      sql_subquery = "title ILIKE :query OR description ILIKE :query"
      @ticket = @tickets.where(sql_subquery, query: "%#{params[:query]}%")
    end

    @is_user_owner = current_user.houses.size > 0
    @room = current_user.room
    @tickets = @room.present? ? Ticket.where(room_id: @room.id) : []

  end

  def tenanthistory
    @tickets = current_user.room.present? ? Ticket.where(room_id: current_user.room.id) : []
    @room = current_user.room
  end

  def ownerhistory
    @house = House.find(params[:house_id])
    @rooms = Room.where(house_id: @house.id)
    @tickets = @rooms.map { |room| room.tickets }.flatten
  end
  
end
