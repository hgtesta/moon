class Execution < ActiveRecord::Base
  belongs_to :service

  def result
    self.timeout ? :timeout : nil || 
    return_code == 0 ? :ok : :error
  end
  
end
