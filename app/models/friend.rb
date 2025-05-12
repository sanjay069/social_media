class Friend < ApplicationRecord
  # enum role: %i[user student staff teacher admin]
  enum :role, { joined: 0, canceled: 1 }

  after_initialize :set_default_role, if: :new_record?
  # set default role to user  if not set
  def set_default_role
  	# debugger
    self.role ||= :friend
  end
end
