require 'spec_helper'

describe "LayoutLinks" do
  it "should be a title in page about" do
    visit about_path
    response.should have_selector('title', :content => "A propos")
  end
  it "should be a title in page contact" do
    visit contact_path
    response.should have_selector('title', :content => "Contact")
  end
end
