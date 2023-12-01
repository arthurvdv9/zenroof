if @room.persisted?
  #form
  json.form render(partial: "houses/formRoom", formats: :html, locals: {house: @house, room: Room.new})

  #room details
  json.inserted_item render(partial: "rooms/roomDetails",
  formats: :html, locals: {room: @room})

else
  json.form render(partial: "houses/formRoom", formats: :html, locals: {house: @house, room: @room})
end
