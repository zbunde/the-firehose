require 'spec_helper'

describe Authorization do

  before { @authorization = Authorization.new(provider: "github", uid: "1341234", user_id: 1 )}
  subject { @authorization }

  it { should respond_to(:user) }
  it { should respond_to(:provider) }
  it { should respond_to(:uid) }
  it { should respond_to(:user_id) }
  it { should be_valid }

  describe "when provider is not present" do
    before { @authorization.provider = " " }
    it { should_not be_valid }
  end

  describe "when uid is not present" do
    before { @authorization.uid = " " }
    it { should_not be_valid }
  end

  describe "when user_id is not present" do
    before { @authorization.user_id = " "}
    it { should_not be_valid }
  end
end
