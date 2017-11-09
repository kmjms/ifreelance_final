class PaymentController < ApplicationController
  include Payu::Helpers
  skip_before_filter :verify_authenticity_token

  def pay(project)

    pos = Payu::Pos.new :pos_id => '508029', :pos_auth_key => 'abcdefghijk', :key1 => 'pRRXKOl8ikMmt9u', :key2 => '4Vj8eK4rloUd272L48hsrarnUA', :add_signature => true
    @transaction = pos.new_transaction(:first_name => 'John', :last_name => 'Doe', :email => 'john.doe@example.org', :client_ip => '1.2.3.4', :amount => 10000, :desc => 'Transaction description')
  
  end
  
  def response
  end

  def confirmation
  end

  def report
    payu_verify_params(params)

    response = Payu['main'].get params[:session_id]

    if response.status == 'OK'
      order = Order.find(response.trans_order_id)

      if response.completed? && order.present?
        # mark order as paid
      else
        # payment not completed
      end
    end

    render :text => 'OK'
  end
  
end
