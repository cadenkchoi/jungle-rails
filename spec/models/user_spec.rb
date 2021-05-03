require 'rails_helper'

RSpec.describe User, type: :model do
  subject {described_class.new(
    first_name:"Jane",
    last_name:"Doe",
    email:"jane@doe.ca",
    password:"Abcdef",
    password_confirmation:"Abcdef"
  )}


  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it "must be created with both password and password_confirmation" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "is not valid if password_confirmation is different from password" do
      subject.password = "abcdef"
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without first name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without last name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid if password length less than 6 characters" do
      subject.password = "abcde"
      subject.password_confirmation = "abcde"
      expect(subject).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    it "checks the login and returns the authenticated user" do
      user = User.create(first_name: "John", :last_name => "Choi", :email => "john@choi.ca", :password => "Abcdef", :password_confirmation => "Abcdef")
      authenticated_user = User.authenticate_with_credentials("john@choi.ca", "Abcdef")
      expect(authenticated_user).to eq(user)
    end

    it "checks the user's email" do
      authenticated_user = User.authenticate_with_credentials("john@choi.ca", "Abcdef")
      expect(authenticated_user).to be(nil)
    end

    it "should return user when email has trailing space(s)" do
      user = User.create(first_name: "John", :last_name => "Choi", :email => "john@choi.ca", :password => "Abcdef", :password_confirmation => "Abcdef")
      authenticated_user = User.authenticate_with_credentials(" john@choi.ca ", "Abcdef")
      expect(authenticated_user).to_not be_nil
    end

    it "should return user when email has wrong case" do
      user = User.create(first_name: "John", :last_name => "Choi", :email => "john@choi.ca", :password => "Abcdef", :password_confirmation => "Abcdef")
      authenticated_user = User.authenticate_with_credentials("JoHn@chOi.ca", "Abcdef")
      expect(authenticated_user).to_not be_nil
    end

  end
  

end
