module MeetingsHelper
    
    def meeting_home_score(id)
        @heat = Heat.where(meeting_id:id)
        @blue = 0
        @red = 0
        @heat.each do |heat|
            heat.blues.each do |blue|
                @blue = blue.score + @blue
            end
            heat.reds.each do |red|
                @red = red.score + @red
            end
        end
        home_score = @blue + @red
    end
    
    def meeting_away_score(id)
        @heat = Heat.where(meeting_id:id)
        @white = 0
        @yellow = 0
        @heat.each do |heat|
            heat.whites.each do |white|
                @white = white.score + @white
            end
            heat.yellows.each do |yellow|
                @yellow = yellow.score + @yellow
            end
        end
        away_score = @white + @yellow
    end
end
