require "test_helper"

class TicketTest < ActiveSupport::TestCase
  test "should require from location" do
    @ticket.from = nil
    assert_not @ticket.valid?
  end

  test "should require to location" do
    @ticket.to = nil
    assert_not @ticket.valid?
  end
end
