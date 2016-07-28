require 'test_helper'

class MemberTest < ActiveSupport::TestCase
    test "should not save member without fields" do
      member = Member.new
      assert_not member.save
    end
end
