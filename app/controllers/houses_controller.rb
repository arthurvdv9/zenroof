class HousesController < ApplicationController
  before_action :set_house, only: [:show]

  def index
    @houses = current_user.houses
    if params[:query].present?
      sql_subquery = "name ILIKE :query OR address ILIKE :query"
      @house = @houses.where(sql_subquery, query: "%#{params[:query]}%")
    end
  end

  def show
    @room = Room.new
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)

    # connect
    @house.user = current_user
    @room = Room.new

    if @house.save
      respond_to do |format|
        format.html { redirect_to house_path(@house) }
        format.text { render partial: "houses/houseDetails", locals: { house: @house, room: @room }, formats: [:html] }
      end

    else
      render :new, status: :unprocessable_entity
    end

  end


  def edit
    @house = House.find(params[:id])
  end

  def update
    @house = House.find(params[:id])
    @house.update(house_params)
    @room = Room.new
    respond_to do |format|
      format.html { redirect_to house_path(@house) }
      format.text { render partial: "houses/houseDetails", locals: { house: @house, room: @room }, formats: [:html] }
    end
  end

  def destroy
    @house = House.find(params[:id])
    @house.destroy
    redirect_to houses_path, status: :see_other
  end

  private

  def set_house
    @house = House.find(params[:id])
  end

  def house_params
    params.require(:house).permit(:address, :name, :capacity, :photo)
  end

end
