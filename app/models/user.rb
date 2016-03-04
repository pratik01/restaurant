class User < ActiveRecord::Base
  include TheRole::Api::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable

  has_many :restaurants
  has_many :cuisine_types
  has_many :contacts
  has_many :assign_staffs
  def self.owner_staff(owner_id)
    @assign_staffs = AssignStaff.find_by_parent_id(owner_id)
    @ids = @assign_staffs.map { |r| r.user_id }
    @users = User.where("id in ?",@ids)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.role_id = defaultRole
      user.password = Devise.friendly_token[0,20]
    end
  end

  def self.defaultRole
     @role = Role.find_by_name("customer")
     @role.id
  end
end
