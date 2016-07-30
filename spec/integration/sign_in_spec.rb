require 'rails_helper'
require 'spec_helper'



describe "GET '/auth/facebook/callback' + create mod" do
  before do
    @exam = Exam.new(nome: "PROVA", anno: "1", sito: "www.google.it", professore: "Bobbo Vieri", professore2: "")
    @exam.save
    @group = Group.new(message: "XXX", location: "via", datetime: "2016-08-03 10:00:00")
    @group.save
  end
  before(:each) do
    valid_facebook_login_setup
    get "/auth/facebook/callback"
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
    visit '/auth/facebook/callback'
  end


  it "signs me in" do
    expect(page).to have_content 'Gaius'
  end
  
  it "blocks url hackerzz" do
    visit '/exams/7575775'
    expect(page).to have_content 'Gaius'
  end
  
  it "show exam" do
    visit '/exams/2'
    expect(page).to have_content 'antartico'
  end
  
  it "exit" do
    get '/signout'
    expect(session[:user_id]).to eq(nil)
  end
  
  it "should set user_id" do
    expect(session[:user_id]).to eq(User.last.id)
  end

  it "should redirect to root" do
    expect(response).to redirect_to root_path
  end
end

describe "GET '/auth/failure'" do

  it "should redirect to root" do
    get "/auth/failure"
    expect(response).to redirect_to root_path
  end
end