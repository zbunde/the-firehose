require 'spec_helper'

describe "links/edit" do
  before(:each) do
    @link = assign(:link, stub_model(Link,
      :url => "MyString",
      :user_id => 1,
      :description => "MyString"
    ))
  end

  it "renders the edit link form" do
    render

    assert_select "form[action=?][method=?]", link_path(@link), "post" do
      assert_select "input#link_url[name=?]", "link[url]"
      assert_select "input#link_user_id[name=?]", "link[user_id]"
      assert_select "input#link_description[name=?]", "link[description]"
    end
  end
end
