class User < ActiveRecord::Base
  validates :email, :provider, presence: true
  validates :name, presence: true, uniqueness: true
end
