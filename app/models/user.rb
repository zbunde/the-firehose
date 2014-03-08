class User < ActiveRecord::Base
  validates :name, :email, :provider, presence: true
end
