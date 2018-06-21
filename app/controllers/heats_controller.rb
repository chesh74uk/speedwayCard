class HeatsController < ApplicationController

  
  def new
    @meeting = Meeting.find(params[:meeting_id])
    @heat = Heat.new
    1.times {@heat.blues.build}
    1.times {@heat.reds.build}
    1.times {@heat.whites.build}
    1.times {@heat.yellows.build}
    last_heat = Heat.last
    last_heat ? @heat.heat_number = last_heat.heat_number + 1 : @heat.heat_number = 1
  end
  
  def edit
    @heat = Heat.find(params[:id])
    @meeting = @heat.meeting
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
    params.require(:heat).permit(:id, :heat_number, :heat_time, :meeting_id, 
        blues_attributes: [:id, :gate_number, :rider_name, :score],
        reds_attributes: [:id, :gate_number, :rider_name, :score],
        yellows_attributes: [:id, :gate_number, :rider_name, :score],
        whites_attributes: [:id, :gate_number, :rider_name, :score])
  end
  
end
