require 'test_helper'

class TutorTest < ActiveSupport::TestCase
    test "should not save tutor without fields" do
      tutor = Tutor.new
      assert_not tutor.save
    end
end
