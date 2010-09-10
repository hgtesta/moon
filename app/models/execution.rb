require "benchmark"

class Execution < ActiveRecord::Base
  belongs_to :service

  validates :timeout, :presence => true

  def execute!
    begin
      Timeout::timeout(service.timeout) do
        benchmark = Benchmark.measure do
          self.command = service.command
          self.output = `#{command}`
          self.return_code = $?
        end
        self.duration = benchmark.real
      end
    rescue Timeout::Error
      @result = "timeout"
    end
    @result || return_code
  end

end
