class PanelsController < ApplicationController
  
  def new
    @panel = Panel.new
    @services = Service.all
  end

  def index
    @panels = Panel.all
  end

  def show
    @panel = Panel.find(params[:id])
    @services = @panel.services
    respond_to do |format|
      format.html
      format.js { 
        result = {}

        # Return to browser should be something like this:
        # {
        #   1 => [[1,:ok], [4, :timeout], [20, :ok], [23, :ok], [44, :ok], [56, :error]]
        #   2 => [[3,:ok], [7, :timeout], [13, :ok], [24, :ok], [31, :ok], [48, :error]]
        # }
        for service in @panel.services
          result[service.id] = service.executions.map { |execution| [execution.id, execution.result] }  
        end
        render :text => result.to_json
      }
    end
  end
  
  def create
    @panel = Panel.new(params[:panel])
    if @panel.save
      redirect_to panels_path, :notice => "Panel successfully created"
    else
      render :new
    end
  end

end
