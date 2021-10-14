require 'rails_helper'

RSpec.describe User, type: :model do
  it "must have a first_name, last_name, and an email" do
    user = User.new
    user.first_name = "Homer"
    user.last_name = "Simpson"
    user.email = "homer@gmail.com"
    expect(user.first_name).to eq("Homer")
    expect(user.last_name).to eq("Simpson")
    expect(user.email).to eq("homer@gmail.com")
  end

end
