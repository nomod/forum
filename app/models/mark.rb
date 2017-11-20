class Mark < ActiveRecord::Base

  belongs_to :users
  belongs_to :post

  validates_presence_of :value, :post_id, :login

end