require 'test_helper'

class CheckoutsControllerTest < ActionController::TestCase
  fixtures :countries, :states, :gateways, :gateway_configurations
  
  context "given current_user" do
    setup do 
      @user = Factory(:user, :email => "test@example.com")
      @controller.stub!(:current_user, :return => @user)

      @order = Factory.create(:order)
      @params = { :final_answer => true, :order_id => @order.number }
      
      @shipping_method = Factory(:shipping_method)               
      @creditcard = Factory.build(:creditcard)
      @creditcard.stub!(:authorize, :return => true)   
      
      @params[:checkout] = {:bill_address_attributes => Factory.build(:address).attributes.symbolize_keys,
                            :ship_address_attributes => Factory.build(:address).attributes.symbolize_keys,
                            :shipping_method_id => @shipping_method.id,
                            :creditcard => @creditcard.attributes.symbolize_keys}
    end
    context "post" do
      setup do
        post :update 
      end
      should_change "Address.count", :by => 2
      should_redirect_to("order completion page") { order_url(@order, :checkout_complete => true) }    
      should "assign the current_user email" do
        assert_equal "test@example.com", assigns(:checkout).email
      end
      should "assign the requestor IP" do
        assert_equal "0.0.0.0", assigns(:checkout).ip_address
      end
      should "assign the requested shipping method" do
        assert_equal @shipping_method, assigns(:checkout).shipping_method
      end
    end
    context "xhr put" do
      setup { xhr :put, :update }
      should_respond_with :success
    end  
  end
end
