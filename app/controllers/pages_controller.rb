class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @houses = House.where(user_id: current_user)

    @sorted_houses = @houses.sort_by do |house|
      house.rooms.map { |room| room.tickets.count }.sum
    end.reverse

    # @tickets = Ticket.all

    if params[:query].present?
      sql_subquery = "name ILIKE :query OR address ILIKE :query"
      @sorted_houses = @houses.where(sql_subquery, query: "%#{params[:query]}%")
    end
    @ticket = Ticket.new

    # if params[:query].present?
    #   sql_subquery = "title ILIKE :query OR description ILIKE :query"
    #   @ticket = @tickets.where(sql_subquery, query: "%#{params[:query]}%")
    # end


    # @tickets = current_user.room.present? ? Ticket.where(room_id: current_user.room.id) : []
    # Additional code to handle the case where @room is not found
    # @is_user_owner = current_user.houses.size > 0
    # # @is_user_tenant = @is_user_owner ? is_owner_also_tenant : true
    @is_user_owner = current_user.houses.size > 0
    @room = current_user.room
    @tickets = @room.present? ? Ticket.where(room_id: @room.id) : []

    # @room_id = @is_user_owner ? retrieve_tenant_room : current_user.rooms[0]
    # @room = Room.find_by(id: @room_id)
    # puts "HELLOOOOOOOOOOOOOOOOOOO"
    # puts @houses
  end

  def tenanthistory
    @tickets = current_user.room.present? ? Ticket.where(room_id: current_user.room.id) : Ticket.none
    if params[:query].present? && current_user.room.present?
      sql_subquery = "title ILIKE :query OR description ILIKE :query"
      @tickets = @tickets.where(sql_subquery, query: "%#{params[:query]}%")
    end
    @room = current_user.room
  end

  def ownerhistory
    @sorted_house = House.find(params[:house_id])
    @rooms = Room.where(house_id: @sorted_house.id)
    @tickets = @rooms.map { |room| room.tickets }.flatten
    if params[:query].present?
      @tickets = @tickets.select do |ticket|
        ticket.title.include?(params[:query]) || ticket.description.include?(params[:query])
      end
    end
  end
end
