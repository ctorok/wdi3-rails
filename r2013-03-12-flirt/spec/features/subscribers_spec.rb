require 'spec_helper'

describe 'Subscribers' do
  describe 'GET /' do
    it 'displays register link' do
      visit root_path
      page.should have_link('Register')
    end
  end

  describe 'GET /subscribers/new' do
    it 'displays the create subscriber and cancel buttons', :js => true do
      visit root_path
      click_link('Register')
      page.should have_button('Cancel')
      page.should have_button('Create Subscriber')
    end
  end

   describe 'POST /subscribers' do
    it 'creates a new subscriber', :js => true do #this means that we will be using javascript
      visit root_path
      click_link('Register')
      page.should have_button('Cancel')
      fill_in('Username', :with => 'Bob')
      fill_in('Email', :with => 'bob@gmail.com')
      fill_in('subscriber_password', :with => 'a')
      fill_in('subscriber_password_confirmation', :with => 'a')
      click_button('Create Subscriber') #we are doing AJAX, and will be staying on the same page
      page.should_not have_button('Create Subscriber') #this causes rails to wait and process the creation of the user, because it knows that this is a JS call
      page.should have_text('You have successfully created an account')
      expect(Subscriber.first.username).to eq 'Bob'
    end
  end

  describe 'Javascript cancel_subscriber_form' do
    it 'it removes the create subscriber form', :js => true do
      visit root_path
      click_link('Register')
      click_button('Cancel')
      page.should_not have_button('Create Subscriber')
    end
  end



end
