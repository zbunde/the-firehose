require 'spec_helper'

describe "links?tag=meta" do

  it "should display a link after creating it" do
    login
    @user = User.create!(name: "User", email: "user@example.com", provider: "github")
    @authorization = Authorization.create!(uid: "123545", user: @user, provider: "github")
    @link = Link.create! url: "google.com", tag_list: "meta", user_id: @user.id, title: "I'm a link", description: "This is a description"
    visit "/"
    click_on "Login with Github"
    visit "/links?tag=meta"
    expect(page).to have_content("I'm a link")
    expect(page).to have_content("This is a description")
  end
end