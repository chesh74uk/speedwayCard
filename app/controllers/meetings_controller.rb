class MeetingsController < ApplicationController
    before_action :set_meeting, only: [:show, :edit, :update, :destroy]
    
    def index
        @meetings = Meeting.all.order(date: :desc)
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
        @meeting = Meeting.find(params[:id])
        
        if @meeting.heats.present?
            @heat = Heats.where
            @heat.each do |heat|
                heat.blues.each do |blue|
                    @blue = blue.score
                    @blue = @blue + @blue
                end
                heat.reds.each do |red|
                    @red = red.score
                    @red = @red + @red
                end
                heat.whites.each do |white|
                    @white = white.score
                    @white = @white + @white
                end
                heat.yellows.each do |yellow|
                    @yellow = yellow.score
                    @yellow = @yellow + @yellow
                end
            end
            @meeting.home_score = @blue + @red
            @meeting.away_score = @white + @yellow
            
                
            #blue_total = @heat.blues.sum(:score)
            #red_total = @heat.reds.sum(:score)
            #@meeting.home_score = blue_total + red_total
            #white_total = @heat.whites.sum(:score)
            #yellow_total = @heat.yellows.sum(:score)
            #@meeting.away_score = white_total + yellow_total
        end
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
    
    def destroy
        @meeting.destroy
        respond_to do |format|
          format.html { redirect_to meetings_url, notice: 'Meeting was deleted.' }
        end
    end
    
    private
    def set_meeting
      @meeting = Meeting.find(params[:id])
      
    end
    
    def meeting_params
        params.require(:meeting).permit(:date, :home_team, :away_team, :home_score, :away_score, 
        :home_rider_1, :home_rider_2, :home_rider_3,  :home_rider_4, :home_rider_5, :home_rider_6, :home_rider_7,
        :away_rider_1, :away_rider_2, :away_rider_3, :away_rider_4, :away_rider_5, :away_rider_6, :away_rider_7)
    end
end
