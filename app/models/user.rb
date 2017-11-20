class User < ActiveRecord::Base

  has_many :posts
  has_many :marks

  validates_presence_of :login
  validates_uniqueness_of :login, case_sensitive: false

end