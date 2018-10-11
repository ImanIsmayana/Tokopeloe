class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :dashboards
  has_many :products
  has_many :stores
  has_many :orders
  has_many :reviews, dependent: :destroy

  acts_as_messageable


  def mailboxer_email(object)
  	nil
  end
end
