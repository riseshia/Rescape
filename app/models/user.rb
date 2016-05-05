class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :recoverable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  validates :username, uniqueness: true
  validates :email, uniqueness: true

  has_many :reviews

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
