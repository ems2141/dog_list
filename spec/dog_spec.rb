require 'spec_helper'
require_relative '../dog'

Capybara.app = Dog

feature Dog do
  before do
    DB[:dog_list].delete
  end

  it "should add and show a list of dogs" do

    visit '/'
    expect(page).to have_no_content("pug #{rand(2)}")
    fill_in "Dog Type", with: 'dog_name'
    click_on('Add dog')
    expect(page).to have_content 'dog_name'

  end

end