require 'spec_helper'

describe "LayoutLinks" do
  it "should have a Home page at '/'" do
    get '/'
    # response.should have_selector('head title', :content => "Home") 
    page.should have_selector("#home #container")
  end

end
