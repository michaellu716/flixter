class Section < ApplicationRecord
	belongs_to :course
	has_many :lessons
	mount_uploader :image, ImageUploader
end
