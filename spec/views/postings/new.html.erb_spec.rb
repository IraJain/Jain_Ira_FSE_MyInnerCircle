require 'spec_helper'

describe "postings/new" do
  before(:each) do
    assign(:posting, stub_model(Posting,:title => "view test title", :description => "view description", :phone => 123456,:location =>'Palo Alto').as_new_record)
  end

  it "renders new posting form" do
    render

    assert_select "form", :action => postings_path, :method => "post" do
      assert_select "input#posting_title", :name => "posting[title]"
      assert_select "input#posting_location", :name => "posting[location]"
      assert_select "input#posting_phone", :name => "posting[phone]"
    end
  end
end
