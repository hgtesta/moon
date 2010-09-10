class Panel < ActiveRecord::Base
  has_and_belongs_to_many :services
end
