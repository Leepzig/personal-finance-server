require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a first_name, last_name, and an email" do
    user = User.new
    user.first_name = "Homer"
    user.last_name = "Simpson"
    user.email = "homer@gmail.com"
    user.password = "123"
    expect(user.first_name).to eq("Homer")
    expect(user.last_name).to eq("Simpson")
    expect(user.email).to eq("homer@gmail.com")
    expect(user.password).to eq("123")
  end

  it "requires a first_name" do
    user = User.create(last_name:"Simpson", email:"homer@gmail.com", password:"123")
    expect(user).to_not be_valid
  end

  it "requires a last_name" do 
    user = User.create(first_name:"Homer", email:"homer@gmail.com", password:"123")
    expect(user).to_not be_valid
  end

  it "requires an email" do
    user = User.create(first_name:"Homer", last_name:"Simpson", password:"123")
    expect(user).to_not be_valid
  end

  it "has a unique email address" do
    user = User.create(first_name:"Homer", last_name:"Simpson", password:"123")
    user1 = User.create(first_name:"Homer", last_name:"Simpson", password:"123")
    expect(user1).to_not be_valid
  end

  it "#full_name returns a user's first and last name" do
    user = User.create(first_name:"Homer", last_name:"Simpson", password:"123")
    expect(user.full_name).to eq("Homer Simpson")
  end
  
end
