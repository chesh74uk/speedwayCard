class MeetingsController < ApplicationController
    
    def index
        @meetings = Meeting.all
    end
    
    def new
        @meeting = Meeting.new
    end
    
    def create
        @meeting = Meeting.create(meeting_params)
        redirect_to meetings_path
    end
    
    private
    def meeting_params
        params.require(:meeting).permit(:date, :home_team, :away_team)
    end
end
