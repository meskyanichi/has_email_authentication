require "spec_helper"

RSpec.describe HasEmailAuthentication do

  let(:user) { User.new }

  it "validates the presence of the email" do
    expect(User.create.errors[:email]).to include("can't be blank")
  end

  it "validates the format of the email" do
    ["mike", "mike@", "mike@example", "mike@example."].each do |value|
      expect(User.create(email: value).errors[:email])
        .to include("is invalid")
    end
  end

  it "validates the uniqueness of the email" do
    email = "michael@example.com"
    User.create!(email: email)
    expect(User.create(email: email).errors[:email])
      .to include("is unavailable")
  end

  it "has a customizable validator" do
    email = "michael@example.com"
    UserCustom.create!(email: email)
    expect(UserCustom.create(email: email).errors[:email])
      .to include("has already been taken")
  end

  it "should downcase the email" do
    user = User.create(email: "MICHAEL@example.com")
    expect(user.reload.email).to eq("michael@example.com")
  end

  it "should provide a method to find by downcased email" do
    user = User.create(email: "michael@example.com")
    expect(User.find_by_email("MICHAEL@EXAMPLE.COM").id).to eq(user.id)
  end
end
