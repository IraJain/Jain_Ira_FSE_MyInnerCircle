require 'spec_helper'

describe FriendsController do

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    sign_in @user

    @user1 = User.new( first_name: "Ira ", last_name: "Jain", email:    "ira@test.com", password: "pass1234",
    password_confirmation: "pass1234")
    @user1.save
  end

  def table_data_friend
    {friend_id: @user1.email}
  end

  describe "POST create" do

      it "creates a new Friend" do
        expect {
          post :create, {:friend => table_data_friend}
        }.to change(Friend, :count).by(1)
      end

      it "assigns a newly created friend as @friend" do
        post :create, {:friend => table_data_friend}
        assigns(:friend).should be_a(Friend)
        assigns(:friend).should be_persisted
      end

    end

    end
