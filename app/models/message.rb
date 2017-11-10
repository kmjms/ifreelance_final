class Message < ApplicationRecord
    after_create :broadcast
    
    
    private
    
    def broadcast
        ChatSenderJob.perform_now self
        #ActionCable.server.broadcast("support_#{self.support_id}",self.as_json)
    end
    
end
