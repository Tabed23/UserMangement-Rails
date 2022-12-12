class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :username, type: String
  field :email, type: String
  field :password_digest, type: String

  # validates user input
  validates :username, uniqueness: true, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, :length => {:minimum => 4}, :on => :create

  has_secure_password
end
