
class ExecutionsController < ApplicationController
   
  def create
    @service = Service.find(params[:service_id])
    @execution = @service.executions.build
    #Thread.new {
      @execution.execute!
   #}
    @service.save!
    render :text => @result
  end

  def show
  end

end
