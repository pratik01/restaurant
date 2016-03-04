class PaymentController < ApplicationController
  before_action :login_required, only: [ :index ]
  def index
    response = GATEWAY.purchase(price_in_cents, credit_card, purchase_options)
    puts response.to_json
  end
  def price_in_cents
    (50*100).round
  end
  private

  def purchase_options
    {
        :ip => "127.0.0.1",
        :billing_address => {
            :name     => "Ryan Bates",
            :address1 => "123 Main St.",
            :city     => "New York",
            :state    => "NY",
            :country  => "US",
            :zip      => "10001"
        }
    }
  end
  def validate_card
    unless credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        errors.add_to_base message
      end
    end
  end

  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
        :type               => "VISA",
        :number             => "4311192846687979",
        :verification_value => "123",
        :month              => 02,
        :year               => 2021,
        :first_name         => "pratik",
        :last_name          => "panchal"
    )
  end
end
