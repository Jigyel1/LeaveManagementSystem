class User < ApplicationRecord
  has_one_attached :image
  enum role: [:super_admin, :admin, :employee]
	after_initialize :set_default_role, :if => :new_record?

	def set_default_role
		self.role ||= :employee
	end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
