if @house.persisted?
  json.house_details render(partial: "houseDetails", formats: :html, locals: {house: @house, room: Room.new})

else
  json.form_with_errors render(partial: "formHouse", formats: :html, locals: {house: @house})
end
