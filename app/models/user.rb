class User < ActiveRecord::Base
	has_many :posts, dependent: :destroy
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :email, presence: {message: 'email is compulsory'}
  validates :email, :uniqueness => {:message => "already taken"}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 # validates :phone, uniqueness: { scope: :user_id }
  validates :email, length: { maximum: 255 },
  format: { with: VALID_EMAIL_REGEX }, 
  uniqueness: { case_sensitive: false }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end



# class User < ActiveRecord::Base
# before_save { self.email = email.downcase }
# validates :name,  presence: true, length: { maximum: 50 }
# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
#  validates :email, presence: true, length: { maximum: 255 },
#  format: { with: VALID_EMAIL_REGEX }, 
#  uniqueness: { case_sensitive: false }
# has_secure_password
# validates :password, length: { minimum: 6 }
# end