class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects

  def is_staff?
    if self.role == 'staff'
      return true
    else
      return false
    end
  end

  def active_projects
    return self.projects.where(["status = ?", true])
  end
end
