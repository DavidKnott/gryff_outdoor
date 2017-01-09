require 'rails_helper'

RSpec.describe Order, type: :model do

  attr_reader :order

  before(:each) do
    @order = create:order
  end

  describe "relationships" do
    it { should belong_to(:user)}
    it { should have_many(:order_items)}
    it { should have_many(:items)}
  end

  describe "calculations" do
    it "can count the amount of all its' items" do
      expect(order.count).to eq 5
    end

    it "can calculate the total price of all its items" do
      total_price = order.items.inject(0) {|sum, item| sum += item.price}
      
      expect(order.total_price).to eq total_price
    end
  
    it "can return a special message if the status is completed" do
      order = create(:order, status: 1)
      
      expect(order.canceled_or_completed).to eq "Completed at #{order.updated_at}"
    end

    it "can return a special message if the status is cancelled" do
      order = create(:)
    end



  end
end