class Execution < ActiveRecord::Base
  belongs_to :service

  def result
    timeout ? :timeout : nil || 
    return_code == 0 ? :ok : :error
  end
  
end
