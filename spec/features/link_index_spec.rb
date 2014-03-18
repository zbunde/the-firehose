require 'spec_helper'

describe "links/tagged/meta" do
  subject { page }
  before { @user = User.new(name: "User", email: "user@example.com", provider: "github") }
  before { @link = Link.create url: "google.com", user_id: 1, tag_list: "search, meta" }
  before { visit "/links/tagged/meta" }


  it "should display the link based on its tag" do
    expect(page).to have_content("google.com")
  end
end