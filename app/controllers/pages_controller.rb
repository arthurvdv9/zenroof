class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    # @houses = House.where(user_id: current_user)
    # @tickets = Ticket.where(user_id: current_user)
  end
end
