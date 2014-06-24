class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :city,:password,:password_confirmation, :remember_me, :email, :name, :phone, :state, :street, :created_at, :updated_at, :country, :authentication_token, :current_sign_in_at, :current_sign_in_ip, :deleted_at, :encrypted_password, :id, :last_sign_in_at, :last_sign_in_ip, :password_salt, :remember_created_at, :reset_password_sent_at, :reset_password_token, :sign_in_count
  
  validates :name, presence: true
  validates :email, presence: true
  
end
