require "benchmark"

class Execution < ActiveRecord::Base
  belongs_to :service

  def execute!
    begin
      Timeout::timeout(service.timeout) do
        benchmark = Benchmark.measure do
          command = service.command
          output = `#{command}`
          return_code = $?
        end
        duration = benchmark.real
      end
    rescue Timeout::Error
      @result = "timeout"
    end
  end

end
