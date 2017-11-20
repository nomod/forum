class Post < ActiveRecord::Base

  belongs_to :user
  has_many :marks

  validates_presence_of :header, :content, :login, :user_ip

end