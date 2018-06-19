class MeetingsController < ApplicationController
    
    def index
    end
    
    def new
        @meeting = Meeting.new
    end
end
