require 'rails_helper'

describe 'home page' do
  before do
    @exam = Exam.create(nome: "AAA", anno: "1", sito: "www", professore: "aaa", professore2: "")
    @group = Group.create(message: "XXX", location: "via", datetime: "2016-08-03 10:00:00")
  end
  
  it 'welcomes the user' do
    visit '/'
    page.should have_content('Benvenuto')
  end
  it "don't shows exams" do
    visit exam_group_path(@exam, @group)
    page.should have_content("Benvenuto in UniGroup")

  end
end
