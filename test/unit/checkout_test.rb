require 'test_helper'

class CheckoutTest < ActiveSupport::TestCase
  fixtures :gateways, :gateway_configurations
  
  should_belong_to :bill_address
  should_belong_to :ship_address
  
  context "create" do 
    context "with valid creditcard" do
      setup do
        creditcard = Factory.attributes_for(:creditcard)                                           
        Checkout.create(Factory(:checkout, :creditcard => creditcard).attributes.symbolize_keys)
      end
      should_change "Checkout.count", :by => 1
      should_not_change "Creditcard.count"
    end   
    context "with invalid creditcard" do
      setup do
        Checkout.create(Factory(:checkout, :creditcard => {}).attributes.symbolize_keys)
      end
      should_not_change "Checkout.count"
      should_not_change "Creditcard.count"
    end  
    context "with an unauthorizable creditcard" do
      setup do
        creditcard = Factory.attributes_for(:creditcard, :number => 4111111111111110)
        begin                                           
          Checkout.create(Factory(:checkout, :creditcard => creditcard).attributes.symbolize_keys)
        rescue
          # we expect a gateway error exception here
        end
      end
      should_not_change "Checkout.count"
      should_not_change "Creditcard.count"
    end  
  end
end
