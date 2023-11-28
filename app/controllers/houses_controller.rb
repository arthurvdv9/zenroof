class HousesController < ApplicationController
  before_action :set_house, only: [:show]

  def new
    @house = House.new

  end

  def create
    @house = House.new(house_params)

    # connect
    @house.user = current_user

    if @house.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def house_params
    params.require(:house).permit(:address, :name, :capacity)
  end


end
