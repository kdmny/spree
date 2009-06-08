require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  
  context "create" do
    setup { Order.create }
    should_change "Checkout.count", :by => 1
  end
  
end