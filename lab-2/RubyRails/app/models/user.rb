class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:student, :instructor, :admin]
  after_initialize :set_role_default, :if => :new_record?
  def set_role_default
    self.role ||= :student
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # TODO add validation
end
