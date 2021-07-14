class Leav < ApplicationRecord
    has_rich_text :reason
	has_rich_text :feedback
    belongs_to :user
    enum status: [:Pending, :Approved, :Rejected]
	after_initialize :set_default_status, :if => :new_record?
	validates_presence_of :reason, :message => "Fields Required!"

	def set_default_status
		self.status ||= :Pending
	end
end
