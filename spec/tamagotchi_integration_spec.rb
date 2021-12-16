require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('create a new tomogatchi', {:type => :feature}) do
  it('creates a tomogatchi and then goes to the game page') do
    visit('/home')
    fill_in('name', :with => 'Mr. Buttons')
    click_on('Start Game!')
    expect(page).to have_content('Mr. Buttons')
  end
end

describe('increment food, sleep, activity levels', {:type => :feature}) do
  it('creates a tomogatchi and then goes to the game page and increments levels') do
    visit('/home')
    fill_in('name', :with => 'Mr. Happy')
    click_on('Start Game!')
    click_on('Feed')
    click_on('Play With')
    click_on('Go Sleep')
    expect(page).to have_content('Food level: 11')
    expect(page).to have_content('Rest level: 11')
    expect(page).to have_content('Activity level: 11')
  end
end

describe('see if our pet dies', {:type => :feature}) do
  it('after 10 seconds of sleeping, when feed is clicked our pet dies') do
    visit ('/home')
    fill_in('name', :with => 'Toodles')
    click_on('Start Game!')
    sleep 10
    click_on('Feed')
    expect(page).to have_content('YOUR PET IS DEAD')
  end
end
