require 'spec_helper'

describe(Reading) {
  before do
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
                                                                  :provider => 'github',
                                                                  :uid => '123545'
                                                                })
    @user = User.create!(name: 'User', email: 'user@example.com', provider: 'github')
    @authorization = Authorization.create!(uid: '123545', user: @user, provider: 'github')
    @reading = Reading.new(title: 'A reading', url: 'google.com', description: 'A search engine', user_id: @user.id, is_active: true)
  end
  it 'should respond to its attributes' do
    expect(@reading.title).to eq 'A reading'
    expect(@reading.url).to eq 'google.com'
    expect(@reading.description).to eq 'A search engine'
    expect(@reading.is_active).to eq true
    expect(@reading.user).to eq @user
  end

}
