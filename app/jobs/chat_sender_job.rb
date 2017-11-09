class ChatSenderJob < ApplicationJob
  queue_as :default

  def perform(message)
    # Do something later
    ActionCable.server.broadcast("support_#{message.support_id}",message.as_json.merge(action:'SendMessage'))
  end
end
