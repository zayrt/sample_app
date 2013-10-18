require 'spec_helper'

describe "AuthenticationPages" do
  describe "with valid information" do
    let(:user) { FactoryGirl.create(:user) }
    before { sign_in user }

    it { should have_title(user.name) }
    it { should have_link('Profile',     href: user_path(user)) }
    it { should have_link('Settings',    href: edit_user_path(user)) }
    it { should have_link('Sign out',    href: signout_path) }
    it { should_not have_link('Sign in', href: signin_path) }
  end
  
  describe "in the Microposts controller" do
    describe "submitting to the create action" do
      before { post microposts_path }
      specify { expect(response).to redirect_to(signin_path) }
    end
    
    describe "submitting to the destroy action" do
      before { delete micropost_path(FactoryGirl.create(:micropost)) }
      specify { expect(response).to redirect_to(signin_path) }
    end
  end
end

