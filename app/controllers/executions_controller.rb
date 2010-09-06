class ExecutionsController < ApplicationController
   
  def create
    @service = Service.find(params[:service_id])
    #Thread.new {
    begin
      Timeout::timeout(5) do
        execution = Execution.new(:command => @service.command)
        execution.output = `#{@service.command}`
        execution.return_code = $?                                  
        @service.executions << execution
        @result = execution.return_code
      end
    rescue Timeout::Error
      @result = "timeout"
    end     
    #}
    render :text => @result
  end

  def show
  end

end
