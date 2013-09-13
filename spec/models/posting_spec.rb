require 'rspec'
require 'spec_helper'


describe 'postings creation test' do

  let(:posting) { FactoryGirl.create(:posting) }

  subject {posting}

  it { should be_valid }

  it 'should validate for presence of title' do
    subject.title = " "
    should_not be_valid
  end

  it 'should validate for presence of description' do
    subject.description = " "
    should_not be_valid
  end

  it 'is invalid for title length > 350' do
    subject.title = "A" * 351
    should_not be_valid
  end


end