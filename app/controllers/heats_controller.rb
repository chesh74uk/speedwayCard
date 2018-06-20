class HeatsController < ApplicationController

  
  def new
    meeting = Meeting.find(params[:meeting_id])
    @heat = meeting.heats.build
    last_heat = Heat.last
    
    if last_heat.nil? || last_heat.heat_number.nil? 
      @heat.heat_number = 1
    else
      @heat.heat_number = last_heat.heat_number + 1
    end
    
  end
  
  def edit
    meeting = Meeting.find(params[:meeting_id])
    @heat = meeting.heats.find(params[:id])
  end
  
  
  def update
    meeting = Meeting.find(params[:meeting_id])
    @heat = meeting.heats.find(params[:id])
    respond_to do |format|
      if @heat.update_attributes(heat_params)
        format.html { redirect_to meeting_path(params[:meeting_id]), notice: 'Heat changed' }
      else
        format.html { render :new, notice: 'Oops!' }
      end
    end
  end
  
  
  def show
    meeting
    @heat = meeting.heats.find(params[:id])
  end
  
  def create
    meeting = Meeting.find(params[:meeting_id])
    @heat = meeting.heats.create(heat_params)
    respond_to do |format|
            if @heat.save
                format.html { redirect_to meeting_path(params[:meeting_id]), notice: 'Heat added' }
            else
                format.html { render :new, notice: 'Oops!' }
            end
        end
  end
  
  private def heat_params
    params.require(:heat).permit(:heat_number, :heat_time)
  end
  
end
