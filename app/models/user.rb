class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets
  validates :username, :email, presence: true

  extend Slug::ClassMethods
  include Slug::InstanceMethods
end
