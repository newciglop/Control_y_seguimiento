class User < ApplicationRecord

  def self.ADMINISTRATOR
    1
  end
  def self.AUTHOR
    2
  end
  def self.EDITOR
    3
  end


  def destroy
    update_attributes(deactivated: true) unless deactivated
  end

  def active_for_authentication?
    super && !deactivated
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
