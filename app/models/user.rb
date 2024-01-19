class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :companies
  # attribute method name type of method default will be thired argument
  #with attribute method we don't need addition callback and method
  attribute :role, :string, default: 'admin'
  
  # before_create :set_user_role

  ROLES = %w{super_admin admin senior_admin editor collabrator}

  def jwt_payload
    super
  end   

  # Instead of writing many method for roles we can use meta programming.

  ROLES.each do |role_name|
    define_method "#{role_name}?" do
      role == role_name
    end
  end 
  
  # def set_user_role
  #   self.role = 'admin'
  # end  

  #aad ? if you want return boolean value wheather it is true or false
  # def super_admin?
  #   role == 'super_admin'
  # end

  # def major_admin?
  #   role == 'major_admin'
  # end

  # def senior_admin?
  #   role == 'senior_admin'
  # end

  # def editor?
  #   role == 'editor'
  # end

  # def collabrator?
  #   role == 'collabrator'
  # end
end
