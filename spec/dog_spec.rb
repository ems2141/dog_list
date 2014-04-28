require 'spec_helper'
require_relative '../dog'

Capybara.app = Dog

feature Dog do
  before do
    DB[:dog_list].delete
  end

  it "should add and show a list of dogs" do

    visit '/'
    fill_in 'Dog Type', with: 'Pug'
    click_on('Add dog')
    expect(page).to have_content 'Pug'

    click_on 'Show Dog'
    expect(page).to have_content 'Pug'

    click_on 'Edit'
    fill_in 'dog_name', with: 'Lab'
    click_on 'Update'
    expect(page).to have_content 'Lab'
    expect(page).to have_no_content 'Pug'


    click_on 'Show Dog'

    click_on 'Delete'
    expect(page).to have_no_content 'Lab'
  end

end