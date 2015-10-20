class Question < ActiveRecord::Base
  has_many:answers
  validates :statement, :presence => true
end
