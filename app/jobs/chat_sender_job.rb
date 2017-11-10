class ChatSenderJob < ApplicationJob
  queue_as :default

  def perform(message)
    # Do something laterActionCable.server.broadcast("support_#{message.support_id}",message.to_json)
    ActionCable.server.broadcast("support_#{message.support_id}",message.as_json)
  end
end
