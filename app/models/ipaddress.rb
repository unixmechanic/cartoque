class Ipaddress < ActiveRecord::Base
  belongs_to :server
  acts_as_ipaddress :address

  validates_presence_of :server

  def to_s
    return "" if address.blank?
    html = address
    html << " (vip)" if virtual?
    html = %(<strong>#{html}</strong>) if main?
    html.html_safe
  end
end
