require 'spec_helper'

describe Placement do
  let(:placement) { FactoryGirl.build :placement }
  subject { placement }

  it { should respond_to :order_id }
  it { should respond_to :product_id }
  it { should respond_to :quantity }

  it { should belong_to :order }
  it { should belong_to :product }

  describe "#decrement_product_quantuty!" do
    it "decreases the product quantity by the placement quantuty" do
      product = placement.product
      expect{placement.decrement_product_quantuty!}.to change{product.quantity}.by(-placement.quantity)
    end
  end
end
