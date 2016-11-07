class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat"
    # stream_from "chat_#{params[:room]}"
  end

  def receive(data)
    ActionCable.server.broadcast "chat", data
  end
end
