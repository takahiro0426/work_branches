class Community < ApplicationRecord
	belongs_to :user_community, optional: true

end
