class MessagesController < ApplicationController

  def create
    @ticket = Ticket.find(params[:ticket_id])
    @message = Message.new(message_params)
    @message.ticket = @ticket
    @message.user = current_user
    if @message.save
      TicketChannel.broadcast_to(
        @ticket,
        render_to_string(partial: "message", locals: {message: @message})
      )
      head :ok
    else
  end
end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
