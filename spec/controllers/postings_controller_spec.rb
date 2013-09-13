require 'spec_helper'

describe PostingsController do

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    sign_in @user

  end

  def table_data_post
    {title: "testing title", description: "this is desc for testing post controller"}
  end

  describe "GET new" do
    it "assigns a new posting as @posting" do
      get :new, {}
      assigns(:posting).should be_a_new(Posting)
    end
  end

  describe "GET edit" do
    it "assigns the requested posting as @posting" do
     posting = Posting.create! table_data_post
      get :edit, {:id => posting.to_param}
      assigns(:posting).should eq(posting)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "creates a new Posting" do
        expect {
          post :create, {:posting => table_data_post}
        }.to change(Posting, :count).by(1)
      end

      it "assigns a newly created posting as @posting" do
        post :create, {:posting => table_data_post}
        assigns(:posting).should be_a(Posting)
        assigns(:posting).should be_persisted
      end

      it "redirects to the created posting" do
        post :create, {:posting => table_data_post}
        response.should redirect_to(home_index_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved posting as @posting" do
        # Trigger the behavior that occurs when invalid params are submitted
        Posting.any_instance.stub(:save).and_return(false)
        post :create, {:posting => {}}
        assigns(:posting).should be_a_new(Posting)
      end

    end
  end

  describe "GET show" do
    it "assigns the requested posting as @posting" do
      posting = Posting.create! table_data_post
      get :show, {:id => posting.to_param}
      assigns(:posting).should eq(posting)
    end
  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested posting" do
        posting = Posting.create! table_data_post
        Posting.any_instance.should_receive(:update_attributes).with({'title' => 'updated title'})
        put :update, {:id => posting.to_param, :posting => {'title' => 'updated title'}}
      end

      it "assigns the requested posting as @posting" do
        posting = Posting.create! table_data_post
        put :update, {:id => posting.to_param, :posting => table_data_post}
        assigns(:posting).should eq(posting)
      end

      it "redirects to the posting index" do
        posting = Posting.create! table_data_post
        put :update, {:id => posting.to_param, :posting => table_data_post}
        response.should redirect_to(home_index_path)
      end
    end

    describe "with invalid params" do
      it "assigns the posting as @posting" do
        posting = Posting.create! table_data_post
        # Trigger the behavior that occurs when invalid params are submitted
        Posting.any_instance.stub(:save).and_return(false)
        put :update, {:id => posting.to_param, :posting => {}}
        assigns(:posting).should eq(posting)
      end

    end
  end

  describe "DELETE destroy" do
    it "destroys the requested posting" do
      posting = Posting.create! table_data_post
      expect {
        delete :destroy, {:id => posting.to_param}
      }.to change(Posting, :count).by(-1)
    end

    it "redirects to the postings list" do
      posting = Posting.create! table_data_post
      delete :destroy, {:id => posting.to_param}
      response.should redirect_to(home_index_path)
    end
  end


end