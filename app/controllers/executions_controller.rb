
class ExecutionsController < ApplicationController
   
  def create
    @service = Service.find(params[:service_id])
    @execution = @service.executions.build
    #Thread.new {
      @execution.execute!
   #}
#    @execution.save!
    @service.save!
    render :text => @execution.return_code
  end

  def show
  end

end
