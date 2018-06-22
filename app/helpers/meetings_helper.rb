module MeetingsHelper
    
    def meeting_home_score(id)
        heat = Heat.where(meeting_id:id)
        blue_result = 0
        red_result = 0
        heat.each do |heat|
            heat.blues.each do |blue|
                blue_result += blue.score
            end
            heat.reds.each do |red|
                red_result += red.score
            end
        end
        home_score = blue_result + red_result
    end
    
    def meeting_away_score(id)
        heat = Heat.where(meeting_id:id)
        white_result = 0
        yellow_result = 0
        heat.each do |heat|
            heat.whites.each do |white|
                white_result += white.score
            end
            heat.yellows.each do |yellow|
                yellow_result += yellow.score
            end
        end
        away_score = white_result + yellow_result
    end
    
    def rider_score(id, rider)

    end
    
end
