class MeetingsController < ApplicationController
    before_action :set_meeting, only: [:show, :edit, :update, :destroy]
    
    def index
        @meetings = Meeting.all
    end
    
    def edit
    end
    
    def new
        @meeting = Meeting.new
    end
    
    def create
        @meeting = Meeting.create(meeting_params)
        respond_to do |format|
            if @meeting.save
                format.html { redirect_to meetings_path, notice: 'Meeting was successfully created.' }
            else
                format.html { render :new, notice: 'Oops!' }
            end
        end
    end
    
    def show
    end
    
    def update
        respond_to do |format|
          if @meeting.update(meeting_params)
            format.html { redirect_to  meetings_path, notice: 'Meeting was successfully updated.' }
          else
            format.html { render :edit, notice: 'Oops!' }
          end
        end
    end
    
    private
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end
    
    def meeting_params
        params.require(:meeting).permit(:date, :home_team, :away_team)
    end
end
