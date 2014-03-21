module CapybaraHelpers


  def login
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
                                                                  :provider => 'github',
                                                                  :uid => '123545'
                                                                  # etc.
                                                                })
  end
end