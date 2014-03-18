require 'spec_helper'

describe "links/new" do
  before(:each) do
    assign(:link, stub_model(Link,
      :url => "MyString",
      :user_id => 1,
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new link form" do
    render

    assert_select "form[action=?][method=?]", links_path, "post" do
      assert_select "input#link_url[name=?]", "link[url]"
      assert_select "input#link_description[name=?]", "link[description]"
    end
  end
end
