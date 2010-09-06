class ExecutionsController < ApplicationController
   
  def create
    @service = Service.find(params[:service_id])
    Thread.new {
      @service.executions << Execution.new :command => @service.command,
                                           :return_code => $?,
                                           :output => `#{@service.command}`     
    }
  end

end
