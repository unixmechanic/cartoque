require 'spec_helper'

describe Ipaddress do
  it "should store ip address as an integer" do
    ip = Ipaddress.new(:address => "127.0.0.1")
    ip.read_attribute(:address).should eq(IPAddr.new("127.0.0.1").to_i)
  end

  it "should be able to store large addresses" do
    ip = Ipaddress.new(:address => "255.255.255.255")
    ip.read_attribute(:address).should eq(IPAddr.new("255.255.255.255").to_i)
  end

  it "should belong to a server" do
    ip = Ipaddress.new(:address => "192.168.1.1")
    ip.should_not be_valid
    ip.should have(1).error_on(:server)
    ip.server = Factory(:server)
    ip.should be_valid
  end

  it "should leave ipaddress blank if invalid" do
    ip = Ipaddress.new(:address => "abcd", :server => Factory(:server))
    ip.should be_valid
    ip.address.should be_blank
    ip.address = "192.168.1.1"
    ip.should be_valid
    ip.address.should eq "192.168.1.1"
  end

  context "#to_s" do
    it "should return an empty string if no address" do
      Ipaddress.new(:address => "").to_s.should eq("")
    end

    it "should include (vip) if virtual ip" do
      Ipaddress.new(:address => "192.168.1.1", :virtual => true).to_s.should eq("192.168.1.1 (vip)")
    end

    it "should be <strong>'ed if main ip" do
      Ipaddress.new(:address => "192.168.1.1", :main => true).to_s.should eq("<strong>192.168.1.1</strong>")
    end

    it "should return a human-readable address" do
      ip = Ipaddress.new(:address => "127.0.0.1")
      ip.to_s.should eq("127.0.0.1")
    end
  end
end
