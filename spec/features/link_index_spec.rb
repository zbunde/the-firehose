require 'spec_helper'

describe "links?tag=meta" do
  before do
    login
    @user = User.create!(name: "User", email: "user@example.com", provider: "github")
    @authorization = Authorization.create!(uid: "123545", user: @user, provider: "github")
    @link = Link.create! url: "google.com", tag_list: "meta, ruby, search, dude", user_id: @user.id, title: "I'm a link", description: "This is a description"
  end
  it "should display a link after creating it" do
    visit "/"
    click_on "Login with Github"
    visit "/links?tag=meta"
    expect(page).to have_content("I'm a link")
    expect(page).to have_content("This is a description")
  end
end

describe "/links" do
  before do
    login
    @user = User.create!(name: "User", email: "user@example.com", provider: "github")
    @authorization = Authorization.create!(uid: "123545", user: @user, provider: "github")
    @link = Link.create! url: "google.com", tag_list: "meta, ruby, search, dude", user_id: @user.id, title: "I'm a link", description: "This is a description"
  end
  it "should display a list of tags" do
    tags = []
    Link.all.each do |link|
      link.tags.each do |tag|
        tags << tag.name
      end
    end
    visit "/"
    click_on "Login with Github"
    expect(page).to have_content("meta")
    expect(page).to have_content("search")
    expect(page).to have_content("dude")
    expect(page).to have_content("ruby")
  end
end