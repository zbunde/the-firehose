class Authorization < ActiveRecord::Base
  belongs_to :user
  validates :uid, :provider, :user_id, presence: true

  def self.find_or_create(auth_hash)
    unless auth = find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
      user = User.create name: auth_hash["info"]["nickname"], email: auth_hash["info"]["email"], provider: auth_hash["provider"], gravatar: auth_hash["extra"]["raw_info"]["avatar_url"]
      auth = create :user => user, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
    end

    auth
  end
end
