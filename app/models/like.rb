class Like < ActiveRecord::Base
  validates_uniqueness_of :newsfeed_id, :scope => :user_id
  
  belongs_to :user
  belongs_to :newsfeed
end
