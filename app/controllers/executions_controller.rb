
class ExecutionsController < ApplicationController
   
  def create
    @service = Service.find(params[:service_id])
    Thread.new {
      @execution = @service.execute!
    }
    render :text => @execution.result
  end

  def show
    @panel = Panel.find(params[:panel_id])
    @service = Service.find(params[:service_id])
    @execution = @service.executions.find(params[:id])
  end

end
