class User < ActiveRecord::Base
  self.inheritance_column = "role"
  authenticates_with_sorcery!
  validates :password,                presence: true, confirmation: true, length: { minimum: 3}
  validates :email,                   presence: true, uniqueness: true
  validates :password_confirmation,   presence: true
  ROLES = ['Doctor','Staff','Nurse','Admin','Receptionist']

  def set_role
    role = ROLES[0]
  end

end
