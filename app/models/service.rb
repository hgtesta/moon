require "benchmark"

class Service < ActiveRecord::Base
  has_many :executions, :dependent => :destroy
  has_and_belongs_to_many :panels

  validates :name, :presence => true
  validates :timeout, :presence => true, :numericality => true
  
  def execute!
    begin
      Timeout::timeout(self.timeout) do
        benchmark = Benchmark.measure do
          @execution = self.executions.create :command => self.command
          @execution.output = `#{@execution.command}`
          @execution.return_code = $?
        end
        @execution.duration = benchmark.real
        @execution.save
      end
    rescue Timeout::Error
      @execution.update_attribute(:timeout, true)
    end
    @execution
  end
  
end
