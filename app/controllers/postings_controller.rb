class PostingsController < ApplicationController
  before_filter :authenticate_user!

   respond_to :html, :xml, :json

  def index
   # respond_with(@posting =Posting.all)
  end

  # show particular posting. Posting Id passed as a param
  def show
    @posting = Posting.find(params[:id])
    respond_with(@posting)
  end

  # Create a blank new posting object
  def new
    @posting = Posting.new
    respond_with(@posting)
  end

  # Edit the selected posting
  def edit
    @posting = Posting.find(params[:id])
  end

 # Create new posting
  def create

    #Building relationship
    @posting = current_user.postings.new(params[:posting])

    flash.now[:notice] = 'Posting was successfully created.' if @posting.save
    respond_with(@posting,:location => home_index_url)
  end

  # Update posting
  def update
    @posting = Posting.find(params[:id])
    flash.now[:notice] = 'Posting was successfully updated.' if @posting.update_attributes(params[:posting])
    respond_with(@posting,:location => home_index_url)
  end

  # DELETE  particular posting
  def destroy
    @posting = Posting.find(params[:id])
    @posting.destroy

    respond_with(@posting,:location => home_index_url)
  end

end





