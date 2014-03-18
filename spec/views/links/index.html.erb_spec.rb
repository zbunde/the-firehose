require 'spec_helper'

describe "links/index" do
  before(:each) do
    assign(:links, [
      stub_model(Link,
        :url => "Url",
        :user_id => 1,
        :description => "Description"
      ),
      stub_model(Link,
        :url => "Url",
        :user_id => 1,
        :description => "Description"
      )
    ])
  end

  it "renders a list of links" do
    render
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end

