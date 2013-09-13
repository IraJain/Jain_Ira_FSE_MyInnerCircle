require 'spec_helper'

describe PostingsController do

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    sign_in @user


   # visit root_path
    #fill_in "SignIn_email",    with: user.email
    #fill_in "SignIn_password", with: user.password
   # click_button "Sign in"

  end

  def valid_attributes
    {title: "helloji", description: "this is desc"}
  end

  def valid_session
  #   { "warden.user.user.key" => session["warden.user.user.key"] }
  end

    it "assigns a new posting as @posting" do
      get :new, {}
      assigns(:posting).should be_a_new(Posting)
    end

  describe "GET edit" do
    it "assigns the requested micropost as @micropost" do
      dummy = subject.current_user.inspect
      posting = Posting.create! valid_attributes


      get :edit, {:id => posting.to_param}
      assigns(:posting).should eq(posting)
    end
  end


=begin
  describe "GET index" do
    it "assigns all postings" do
      posting = FactoryGirl.create(:posting)
      get :index
      expect(assigns(:postings)).to eq([posting])
    end

    it "renders the index template" do
      get :index  ,:format => "html"
      response.should render_template(:index)

    end
  end
=end

=begin

    describe "Get new" do
      it "should get a new post" do
        get :new
        assigns(:posting).should be_a_new(Posting)
      end
    end

 describe "show" do

      let(:posting) {FactoryGirl.create(:posting) }

   it "should find the posting by its id" do
     get :show, :id => :posting.id
     assigns[:posting].title.should == "test title posting "
   end
 end
=end



end