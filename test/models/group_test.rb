require 'test_helper'

class GroupTest < ActiveSupport::TestCase
    test "should not save group without fields" do
      group = Group.new
      assert_not group.save
    end
end
