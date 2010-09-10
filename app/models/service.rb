class Service < ActiveRecord::Base
  has_many :executions, :dependent => :destroy
  has_and_belongs_to_many :panels
end
