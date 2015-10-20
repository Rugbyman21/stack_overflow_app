class Question < ActiveRecord::Base
  acts_as_votable
  has_many:answers
  validates :statement, :presence => true
end
