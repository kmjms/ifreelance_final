class SupportChannel < ApplicationCable::Channel
      def subscribed
        stream_from "support_#{params[:id]}"
     end

     def unsubscribed
       # Any cleanup needed when channel is unsubscribed
     end

     def speak(message)
       Support.find(params[:id]).messages.create(body:message['body'],sender_type:message['sender'].to_s)
     end

end
