require 'test_helper'

class ExamTest < ActiveSupport::TestCase
    test "should not save exam without fields" do
      exam = Exam.new
      assert_not exam.save
    end

end
