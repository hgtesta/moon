
class ExecutionsController < ApplicationController
   
  def create
    @service = Service.find(params[:service_id])
    #Thread.new {
      @execution = @service.execute!
    #}
    render :text => @execution.result
  end

  def show
  end

end
