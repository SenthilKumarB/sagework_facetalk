require 'spec_helper'

describe "home/index.html.erb" do

  before do
    view.stub(:current_user).and_return(false)
  end

  it "renders home index form" do
    render

    rendered.should have_selector("div[class='col33']") do |col33|
      col33.should have_selector("img[id='make_friends']")
    end

    rendered.should have_selector("div[class='col66']") do |col66|
      col66.should have_selector("div[id='intro']") do |intro|
        intro.should have_selector("h1") do |h1|
          h1.first.text.should == "Make Friends"
        end
        intro.should have_selector("p") do |p|
          p.first.text.should == "\n      The new social media network where you can meet people around the world,\n      share your talents, show your skills, learn, teach and meet celebrities.\n      Everything is just a click away from you.\n    "
        end

        intro.should have_selector("p") do |p|
          p.should have_selector("a[id='register']") do |register|
            register.first.text.should == "Register"
          end
          p.should have_selector("a[id='sign_in']") do |sign_in|
            sign_in.first.text.should == "Sign in"
          end
        end

      end
    end
  end
end






