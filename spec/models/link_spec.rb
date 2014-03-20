require 'spec_helper'

describe Link do
  before { @link = Link.create url: "google.com", user_id: 1, title: "This is a link" }

  it "should respond to a user" do
    expect(@link.user_id).to eq 1
  end

  it "should respond to a url" do
    expect(@link.url).to eq "google.com"
  end

  it "should respond to a title" do
    expect(@link.title).to eq "This is a link"
  end

end
