class PostingsController < ApplicationController
  before_filter :authenticate_user!


  def index
  end

  # GET /postings/1
  def show
    @posting = Posting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /postings/new
  def new
  @posting = Posting.new
    respond_to do |format|
     format.html # new.html.erb
   end
  end

  # GET /postings/1/edit
  def edit
    @posting = Posting.find(params[:id])
  end

  def create

    #Building relationship
    @posting = current_user.postings.new(params[:posting])

    respond_to do |format|
      if @posting.save
    #    format.html {render :partial => 'index', object: @posting, notice: 'Posting was successfully created.'}
       format.html { redirect_to home_index_path, notice: 'Posting was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /postings/1
  def update
    @posting = Posting.find(params[:id])

    respond_to do |format|
      if @posting.update_attributes(params[:posting])
        format.html { redirect_to home_index_path, notice: 'Posting was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /postings/1
  def destroy
    @posting = Posting.find(params[:id])
    @posting.destroy

    respond_to do |format|
      format.html { redirect_to home_index_url }
    end
  end
end
