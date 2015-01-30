require 'rails_helper'
require 'faker'
require 'spec_helper'

describe Post do
  
 #    it 'should be a valid post' do
	# 	p = Post.create(user_id: 1, title: 'first post', content: 'this is my first post')
	# 	expect(p).to be_valid
	# end
	it "is a valid factory" do
		FactoryGirl.create(:post).should be_valid
	end
	
	it "is invalid without title" do
		FactoryGirl.build(:post, title: nil).should_not be_valid
	end

	it "has a unique title" do
     	FactoryGirl.create(:post, title: "my title1")
     	p = FactoryGirl.build(:post, title: "my title1")
     	p.valid?
    	expect(p.errors[:title]).to include("has already been taken")
   	end

	# it "has a unique title" do
	# 	# FactoryGirl.build(:post, title: Faker::Lorem.characters(20))
	# 	# expect(p).to not_equal
	# 	p = FactoryGirl.create(:post, title: "my title") 
	# 	p.save
	# 	FactoryGirl.build(:post, title: "my title").should_not be_valid

	# end

	# describe "validations" do
 #    it "has a unique title" do

 #     # before(:each) do
 #        # @class = build_stubbed(:post, title: "Hello World")
 #        # @class.save
 #        # @class2 = build_stubbed(:post, title: "Hello World")
 #        p = FactoryGirl.build(:post, title: "my title") 
	# 	p.save
	# 	FactoryGirl.build(:post, title: "my title").should have(1).errors_on(:title)
 #     # end

 #      # it "should not create the second title" do
 #      #   @q.should have(1).errors_on(:title)
 #      # end
 #    end
 #  end


	it "is invalid without content" do
		FactoryGirl.build(:post, content: nil).should_not be_valid
	end
	# it 'should show error for invalid post, having no title' do
	# 	p = Post.create(user_id: 1, title: nil, content: 'this is my first post')
	# 	expect(p).to have(2).errors_on(:title)
	# end
	# it 'should show error for invalid post, having no text' do
	# 	p = Post.create(user_id: 1, title: 'first post', content: nil)
	# 	expect(p).to have(2).errors_on(:content)
	# end

	 it "is invalid if post is no longer than 20 characters" do
	 	FactoryGirl.build(:post, title: Faker::Lorem.characters(21)).should_not be_valid
	 end
	 it "is invalid if summary is longer than 40 characters" do
	 	FactoryGirl.build(:post, content: Faker::Lorem.characters(41)).should_not be_valid
	 end
	 # it "is invalid if post is not smaller than 3 characters" do
	 # 	FactoryGirl.build(:post, title: Faker::Lorem.characters(2)).should_not be_valid
	 # end
	 # it "is invalid if summary is smaller than 5 characters" do
	 # 	FactoryGirl.build(:post, content: Faker::Lorem.characters(4)).should_not be_valid
	 # end

end
