class MeetingsController < ApplicationController
    before_action :set_meeting, only: [:show, :edit, :update, :destroy]
    
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
    
    def show
        
    end
    
    private
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end
    
    def meeting_params
        params.require(:meeting).permit(:date, :home_team, :away_team)
    end
end
