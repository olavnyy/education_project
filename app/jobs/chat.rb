class ChatJob < ApplicationJob
  ActionCable.server.broadcast \
  "chat", { title: 'New things!', body: 'All the news that is fit to print' }
end
