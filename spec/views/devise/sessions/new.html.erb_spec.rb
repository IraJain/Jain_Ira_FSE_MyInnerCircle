require 'spec_helper'

describe "Login page" do
  before { visit root_path }

  it "should have the h1 'MyInnerCircle'" do
    page.should have_selector('h1', text: 'MyInnerCircle')
  end
end