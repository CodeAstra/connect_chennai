class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :database_authenticatable, :lockable, :recoverable, :rememberable, :timeoutable, :validatable and :omniauthable
  devise :registerable, :trackable
end
