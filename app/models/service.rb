class Service < ActiveRecord::Base
  has_many :executions, :dependent => :destroy
end
