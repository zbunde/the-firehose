require 'spec_helper'

describe User do

  before { @user = User.new(name: "User", email: "user@example.com", provider: "github") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:provider) }
  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when provider is not present" do
    before { @user.provider = " "}
    it { should_not be_valid }
  end

end