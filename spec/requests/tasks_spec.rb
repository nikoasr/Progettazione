require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "GET /exams" do
    it "works! " do
      get exams_path
      expect(response).to have_http_status(200)
    end
  end
end
