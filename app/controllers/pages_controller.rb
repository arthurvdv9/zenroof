class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def history
    @tickets = Ticket.where(room_id: current_user.rooms[0].id)
  end

  def home
  end

  def dashboard
    @houses = House.where(user_id: current_user)
    @tickets = Ticket.where(room_id: current_user.rooms[0].id)

    
  end
end
