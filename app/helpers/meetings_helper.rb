module MeetingsHelper
    
    def fastest_heat(id)
       result = Heat.where(meeting_id:id).minimum("heat_time")
    end
    
    def gate_results(id, gate_number)
        gate_score = 0
        gate_blue = 0
        gate_red = 0
        gate_white = 0
        gate_yellow = 0
        heats = Heat.where(meeting_id:id)
        
        heats.each do |heat|
            blue = Blue.where(gate_number: gate_number, heat_id: heat.id).sum(:score)
            gate_blue += blue
            red = Red.where(gate_number: gate_number, heat_id: heat.id).sum(:score)
            gate_red += red
            white = White.where(gate_number: gate_number, heat_id: heat.id).sum(:score)
            gate_white += white
            yellow = Yellow.where(gate_number: gate_number, heat_id: heat.id).sum(:score)
            gate_yellow += yellow
        end
        
        gate_score = gate_blue.to_i + gate_red.to_i + gate_white.to_i + gate_yellow.to_i
    end
    
    
    
    def meeting_home_score(id)
        heats = Heat.where(meeting_id:id)
        blue_result = 0
        red_result = 0
        heats.each do |heat|
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
        heats = Heat.where(meeting_id:id)
        white_result = 0
        yellow_result = 0
        heats.each do |heat|
            heat.whites.each do |white|
                white_result += white.score
            end
            heat.yellows.each do |yellow|
                yellow_result += yellow.score
            end
        end
        away_score = white_result + yellow_result
    end
    
    def home_rider_score(id, rider)
        meeting = Meeting.find(id)
        heats = Heat.where(meeting_id: id)
        total = 0
        blue_score = 0
        red_score = 0
        heats.each do |heat|
            blue = Blue.where(rider_name: rider, heat_id: heat.id).sum(:score)
            blue_score += blue
            red = Red.where(rider_name: rider, heat_id: heat.id).sum(:score)
            red_score += red
        end
        total = blue_score.to_i + red_score.to_i
    end
    
    def away_rider_score(id, rider)
        meeting = Meeting.find(id)
        heats = Heat.where(meeting_id: id)
        total = 0
        white_score = 0
        yellow_score = 0
        heats.each do |heat|
            white = White.where(rider_name: rider, heat_id: heat.id).sum(:score)
            white_score += white
            yellow = Yellow.where(rider_name: rider, heat_id: heat.id).sum(:score)
            yellow_score += yellow
        end
        total = white_score.to_i + yellow_score.to_i
    end
    
end
