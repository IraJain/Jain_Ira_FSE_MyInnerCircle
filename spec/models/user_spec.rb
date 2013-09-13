require 'rspec'
require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }

  subject {user}


   it { should respond_to(:first_name) }
   it { should respond_to(:last_name) }
   it { should be_valid }


    describe "when name is not present" do
      before { user.first_name = " " }
      it { should_not be_valid }
    end

  describe "when last name is not present" do
    before { user.last_name = " " }
    it { should_not be_valid }
  end

  end


