# FactoryGirl.define do
#   factory :user do
#     email 'psprianca25@gmail.com'
#     password 'priyanka'
#   end

# end


require 'faker'

FactoryGirl.define do
	factory :user do
		email {Faker::Internet.email}
		#email "pspriancaa25@gmail.com"
		password "helloworld@1"
	end
end
