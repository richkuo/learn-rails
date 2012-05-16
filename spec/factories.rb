require 'spec_helper'

describe "User pages" do

   subject { page }

   describe "profile page" do
      let(:user) { FactoryGirl.create(:user) }
      before { visit user_path(user) }

      it { should have_selector('h1',    text: user.name) }
      it { should have selector('title', text: user.name_ }
   end
end

