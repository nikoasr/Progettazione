require 'rails_helper'
require 'spec_helper'



describe "GET '/auth/facebook/callback' + create mod" do
  before(:each) do
    valid_facebook_login_setup
    get "/auth/facebook/callback"
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
    visit '/auth/facebook/callback'
  end


  it "signs me in" do
    expect(page).to have_content 'Gaius'
  end
  
  it "exam view " do
    exam = create(:exam)
    
    visit exam_path(exam)
    expect(page).to have_content 'Bobbo Vieri'
  end
  
  it "create group" do
    exam = create(:exam)
    visit exam_path(exam)
    click_link "Aggiungi Gruppo"
    
    fill_in 'group_message', :with => 'XXX'
    fill_in 'autocomplete', :with => 'via'
    fill_in 'group_datetime', :with => '2016-08-03 10:00:00'
    click_button "Crea Gruppo"
    
    expect(page).to have_content 'Creato da Gaius Baltar'
    expect(page).to have_content 'Descrizione: XXX'
  end
  
  it "create tutor-student" do
    exam = create(:exam)
    visit exam_path(exam)
    click_link "Diventa Studente Tutor"
    
    fill_in 'tutor_email', :with => 'a@aa.it'
    fill_in 'tutor_cel', :with => '65466'
    click_button "Crea Tutor"
    
    expect(page).to have_content 'Email: a@aa.it'
    expect(page).to have_content 'Cellulare: 65466'
  end

  
  it "blocks url hackerzz" do
    visit '/exams/7575775'
    expect(page).to have_content 'Gaius'
    expect(page.current_path).to eq '/'
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