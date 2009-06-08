class Checkout < ActiveRecord::Base
  before_save :authorize_creditcard
  belongs_to :order
  belongs_to :shipping_method
  belongs_to :bill_address, :foreign_key => "bill_address_id", :class_name => "Address"
  belongs_to :ship_address, :foreign_key => "ship_address_id", :class_name => "Address"
  accepts_nested_attributes_for :ship_address, :bill_address

  # for memory-only storage of creditcard details
  attr_accessor :creditcard

  private
  def authorize_creditcard   
    return unless order and creditcard.present?
    cc = Creditcard.new(creditcard.merge(:address => self.bill_address, :checkout => self))
    cc.valid? and cc.authorize(order.total)
  end  
end
