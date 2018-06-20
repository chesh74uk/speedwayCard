class HeatsController < ApplicationController

  
  def new
    @heat = Heat.new(:meeting_id => params[:meeting_id])
    last_heat = Heat.last
    last_heat ? @heat.heat_number = last_heat.heat_number + 1 : @heat.heat_number = 1
  end
  
  def edit
    meeting = Meeting.find(params[:meeting_id])
    @heat = meeting.heats.find(params[:id])
  end
  
  
  def update
    @heat = Heat.find(params[:id])
    respond_to do |format|
      if @heat.update_attributes(heat_params)
        format.html { redirect_to meeting_path(@heat.meeting_id), notice: 'Heat changed' }
      else
        format.html { render :new, notice: 'Oops!' }
      end
    end
  end
  

  
  def create
    @heat = Heat.new(heat_params)
    respond_to do |format|
            if @heat.save
                format.html { redirect_to (meeting_path(@heat.meeting_id)), notice: 'Heat added' }
            else
                format.html { render :new, notice: 'Oops!' }
            end
        end
  end
  
  private def heat_params
    params.require(:heat).permit(:heat_number, :heat_time, :meeting_id, gates_Attributes: [:id, gate_number, :helmet_colour. :rider_name, :score])
  end
  
end
