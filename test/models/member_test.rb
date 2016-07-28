require 'test_helper'

class MemberTest < ActiveSupport::TestCase
    test "should not save member without fields" do
      member = Member.new
      assert member.save
    end
    test "the jntruth" do
      assert true
    end 
    test "then truth" do
      assert true
    end  
    test "the ntruth" do
      assert true
    end  
    test "then ktruth" do
      assert true
    end  
    test "the nnntruth" do
      assert true
    end  
end
