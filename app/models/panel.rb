class Panel < ActiveRecord::Base
  has_and_belongs_to_many :services
  
  def dump_executions
    for service in services
      dump = service.executions.map do |execution|
        execution.return_code == 0 ? :ok : :error
      end
    end
  end
  
end
