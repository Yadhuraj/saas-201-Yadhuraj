class Department < ApplicationRecord
	has_many :students, dependent: :destroy
	has_many :sections, dependent: :destroy
end
