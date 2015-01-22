require 'rails_helper'

RSpec.describe "StaticPages", :type => :request do
  describe "GET /static_pages" do
 	#describe "home_Page" do
 	#	before { visit root_path } #before expectations
 	#	it 'should have right content' do 
 	#		page.should have_content('Home Page')  #by capybara
 	#	end
 	#end
 	describe 'clicking link to contact page' do
 		before { click_link 'Contact'}
 		it 'should open contact page' do
 			current_path.should == contact_path
 		end
 	end
  end
end
