require 'spec_helper'

describe "Login page" do
  before { visit root_path }

  it "should have the h1 'MyInnerCircle'" do
    page.should have_selector('h1', text: 'MyInnerCircle')
  end

  it "should go to home page after successful login" do
    user = FactoryGirl.create(:user)
    fill_in "SignIn_email",    with: user.email
    fill_in "SignIn_password", with: user.password
    click_button "Sign in"
    page.should have_link('Sign out')
  end

  it "should not add a user on blank sign up"  do
    expect { click_button "Sign Up" }.not_to change(User, :count)
  end


  it "should add a user on successful sign up" do
    fill_in "First Name",   with: "Test-First"
    fill_in "Last Name",    with: "Test-Last"
    fill_in "SignUp_Email",        with: "user@test.com"
    fill_in "SignUp_Password",     with: "testing123"
    fill_in "Confirmation", with: "testing123"
    expect do
      click_button "Sign Up"
    end.to change(User, :count).by(1)

  end

 it "should take a user to home page after signing up" do

      fill_in "First Name",   with: "Test-First"
      fill_in "Last Name",    with: "Test-Last"
      fill_in "SignUp_Email",        with: "user@test.com"
      fill_in "SignUp_Password",     with: "testing123"
      fill_in "Confirmation", with: "testing123"

      click_button "Sign Up"
     page.should have_link('Sign out')
  end


end

describe "Home Page" do
  let(:user) { FactoryGirl.create(:user) }
  before do
    visit root_path
    fill_in "SignIn_email",    with: user.email
    fill_in "SignIn_password", with: user.password
    click_button "Sign in"
  end

it "should open up  'add new posting' page when user clicks on button 'Add Posting'" do
  click_button "Add Posting"
  page.should have_selector('h1', text: 'New posting')
end

  it "should come back to login page when you sign out" do
    click_link "Sign out"
    page.should have_button('Sign in')
  end

end







