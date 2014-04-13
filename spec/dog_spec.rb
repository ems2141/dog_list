require 'capybara/rspec'
require_relative '../dog'

Capybara.app = Dog

feature Dog do

  it "should add and show a list of dogs" do

    visit '/'
    expect(page).to have_no_content('yellow lab')
    fill_in 'dog_name', with: 'yellow lab'
    click_on('Add dog')
    expect(page).to have content 'yellow lab'

  end

end