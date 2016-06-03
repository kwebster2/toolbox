class User < ActiveRecord::Base
  has_many   :resources
  belongs_to :cohort
end
