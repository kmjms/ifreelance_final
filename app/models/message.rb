class Message < ApplicationRecord
    after_create :broadcast
    
    
    private
    
    def broadcast
        ChatSenderJob.perform_later self
    end
    
end
