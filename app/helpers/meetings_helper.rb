module MeetingsHelper
    
    def gate_results(id, gate_number)
        heats = Heat.where(meeting_id:id)
        gate_score = 0
        gate_blue = 0
        gate_red = 0
        gate_white = 0
        gate_yellow = 0
        heats.each do |heat|
            blues = Blue.where(gate_number: gate_number)
            reds = Red.where(gate_number: gate_number)
            whites = White.where(gate_number: gate_number)
            yellows = Yellow.where(gate_number: gate_number)
            gate_blue = blues.select{|x| x[:gate_number] == gate_number}.map{|y| y[:score].to_i}.reduce(:+)
            gate_red = reds.select{|x| x[:gate_number] == gate_number}.map{|y| y[:score].to_i}.reduce(:+)
            gate_white = whites.select{|x| x[:gate_number] == gate_number}.map{|y| y[:score].to_i}.reduce(:+)
            gate_yellow = yellows.select{|x| x[:gate_number] == gate_number}.map{|y| y[:score].to_i}.reduce(:+)
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
            blues = Blue.where(rider_name: rider)
            reds = Red.where(rider_name: rider)
            blue_score = blues.select{|x| x[:rider_name] == rider}.map{|y| y[:score].to_i}.reduce(:+)
            red_score = reds.select{|x| x[:rider_name] == rider}.map{|y| y[:score].to_i}.reduce(:+)
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
            whites = White.where(rider_name: rider)
            yellows = Yellow.where(rider_name: rider)
            white_score = whites.select{|x| x[:rider_name] == rider}.map{|y| y[:score].to_i}.reduce(:+)
            yellow_score = yellows.select{|x| x[:rider_name] == rider}.map{|y| y[:score].to_i}.reduce(:+)
        end
        total = white_score.to_i + yellow_score.to_i
    end
    
end
