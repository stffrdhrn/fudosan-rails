require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  test "room format manip" do
     client = Client.new
     client.oneldk = 1
     assert_equal "oneldk", client.room_format
     
     client.oneldk = 1
     client.onedk = 1
     assert_equal "oneldk,onedk", client.room_format
     
     client.onedk = 0
     assert_equal "oneldk", client.room_format 
  end
end
