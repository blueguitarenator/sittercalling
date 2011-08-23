require 'spec_helper'

describe "LayoutLinks" do
  it "should have a Home page at '/'" do
    get '/'
    # response.should have_selector('head title', :content => "Home") 
    response.should be_success
  end
  
  it "should have a Contact page at '/contact'" do
    get '/contact'
    # response.should have_selector('head title', :content => "Home") 
    response.should be_success
  end
 
  it "should have a Contact page at '/about'" do
    get '/about'
    # response.should have_selector('head title', :content => "Home") 
    response.should be_success
  end
 
  it "should have a Contact page at '/signup'" do
    get '/signup'
    # response.should have_selector('head title', :content => "Home") 
    response.should be_success
  end

end
