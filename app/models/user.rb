class User < ApplicationRecord
  def self.ADMINISTRATOR
    1
  end

  def self.SIMPLE_USER
    2
  end


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
