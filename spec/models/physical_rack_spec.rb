require 'spec_helper'

describe PhysicalRack do
  before do
    @rack = Factory(:rack1)
    @site = Factory(:room)
  end

  #TODO: move it to a presenter
  describe "#to_s" do
    it "should format correctly with #to_s" do
      @rack.to_s.should eq "Rack 1"
      @site.to_s.should eq "Hosting Room 1"
      @rack.site = @site
      @rack.to_s.should eq "Hosting Room 1 - Rack 1"
    end
  end

  describe "#non_stock scope" do
    it "should see non-stock racks only" do
      rack = PhysicalRack.create(:name => "stock", :status => PhysicalRack::STATUS_STOCK)
      PhysicalRack.non_stock.should_not include(rack)
    end
  end

  describe "#stock?" do
    it "should return true only if rack is marked as stock" do
      PhysicalRack.new(:name => "stock", :status => PhysicalRack::STATUS_STOCK).stock?.should be_true
    end
  end
end
