class Leav < ApplicationRecord
    has_rich_text :reason
    enum status: [:Pending, :Approved, :Rejected]
	after_initialize :set_default_status, :if => :new_record?

	def set_default_status
		self.status ||= :Pending
	end
end
