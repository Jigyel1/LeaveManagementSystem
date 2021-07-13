class User < ApplicationRecord
  has_one_attached :image
  has_many :leavs
  enum role: [:super_admin, :admin, :employee]
	after_initialize :set_default_role, :if => :new_record?
  has_many :notifications, foreign_key: :recipient_id
	def set_default_role
		self.role ||= :employee
	end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
