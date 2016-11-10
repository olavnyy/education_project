class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat"

  # ActionCable.server.broadcast \
  # "chat", data

  #  ActionCable.server.broadcast \
  # "chat", { sent_by: 'Zoryana', body: 'This is a cool chat app.' }
  end

  def unsubscribed
  end

  def receive(data)
    ActionCable.server.broadcast "chat", data
  end

  # def send_a_message(message)
  #   # ActionCable.server.broadcast "chat", message
  # end
end
