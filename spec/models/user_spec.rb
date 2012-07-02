require 'spec_helper'

describe User do

   before do
      @user = User.new(name: "Example User", email: "user@example.com",
                       password: "foobar", password_confirmation: "foobar")
   end

   subject { @user }

   it { should respond_to(:name) }
   it { should respond_to(:email) }
   it { should respond_to(:password_digest) }
   it { should respond_to(:password_confirmation) }

   it { should be_valid }

   it { should respond_to(:authenticate) }
   
describe "when password is not present" do
   before { @user.password = @user.password_confirmaiton = " " }
   it { should_not be_valid }
end


describe "when password doesn't match confirmation" do
   before { @user.password_confirmaiton = "mismatch" }
   it { should_not be_valid }
end

describe "when password confirmation is nil" do
   before {@user.password_confirmation = nil }
   it { should_not be_valid}
end


describe "return value of authenticate method" do
   before { @user.save }
   let(:found_user) { User.find_by_email(@user.email) }

   describe "with valid password" do
      it { should == found_user.authenticate(@user.password) }
   end

   describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_note == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
   end
end

describe "with a password taht's too short" do
   before { @user.password = @user.password_confirmaiton = "a" * 5 }
   it { should be_invalid }
end

describe "remember token" do
  before { @user.save }
  its(:remember_token) { should_not be_blank }
end


end
