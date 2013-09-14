class FriendsController < ApplicationController

  before_filter :authenticate_user!

  def create

    # Retrieving Friend account from User table by passing email id entered in view
    friend_account = User.find_by_email(params[:friend]["friend_id"])

    # Assigning id from friend account in user table to friend's id column to be passed to d/b
    if friend_account!= nil
      params[:friend]["friend_id"] = friend_account.id
    end

     # Building relationship
    @friend = current_user.friends.new(params[:friend])

    respond_to do |format|
      if @friend.save
        format.html { redirect_to home_index_path, notice: 'Friend was successfully created.' }
        format.js
      else
        format.html {redirect_to home_index_path, notice: @friend.errors.full_messages.join(", ") }
        format.js
      end
    end
  end


  # DELETE /friends/1
  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy

    respond_to do |format|
      format.html { redirect_to home_index_url }
    end
  end


end
