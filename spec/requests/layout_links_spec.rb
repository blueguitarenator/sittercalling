require 'spec_helper'

describe "LayoutLinks" do
  
  it "should have a Contact page at '/contact'" do
    get '/contact'
    page.has_selector?('head title', :text => "Contact") 
    response.should be_success
  end
 
  it "should have a Contact page at '/about'" do
    get '/about'
    page.has_selector?('head title', :text => "About") 
    response.should be_success
  end
 
  it "should have a Contact page at '/signup'" do
    get '/signup'
    page.has_selector?('head title', :text => "Home") 
    response.should be_success
  end

end
