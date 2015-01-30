class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
    validates :title, presence: {message: 'title is compulsory'}
    validates :title, :uniqueness => {:message => "has already been taken"}
	validates :content, presence: {message: 'text is compulsory'}
	validates :title, length: {maximum: 20, message: "title length must be smaller than 21 characters"}
	validates :content, length: {maximum: 40, message: "text length must be smaller than 41  characters"}
	# validates :title, length: { minimum: 3, message: "title length must be greateer than 2 characters"}
    # validates :content, length: { minimum: 5 , message: "title length must be greater than 4 character"}
end
