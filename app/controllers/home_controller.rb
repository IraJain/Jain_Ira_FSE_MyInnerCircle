class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index

   # Setting Radio button on first time entry
    if params[:radio_input].nil?
      params[:radio_input]="friend"
    end

    # Pass postings according to selection of radio button on main page

    case  params[:radio_input]
      when "all"
        @posting = Posting.all(:order => "created_at DESC")
        @state_all = true
        @state_friend = false
        @state_own = false

      when "friend"
        allfriends = current_user.friends
        @posting =  []
        allfriends.each do |single_friend|
          @posting += Posting.find_all_by_user_id(single_friend.friend_id)
        end

        @state_all = false
        @state_friend = true
        @state_own = false

      when "own"
        @posting = Posting.find_all_by_user_id(current_user.id)
        @state_all = false
        @state_friend = false
        @state_own = true
    end

   #Creating friend instance
    @friend = Friend.new

    #Show only current users friends
    @friends = current_user.friends

  end


end
