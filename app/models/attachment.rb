class Attachment < ActiveRecord::Base
	belongs_to :project
	has_attached_file :file, dependent: :destroy
	validates_attachment :file,
	                     content_type: {:content_type => ['application/pdf',
	                                                      'text/plain',
	                                                      'application/msword',
	                                                      'application/vnd.openxmlformats-officedocument.wordprocessingml.document']}
	validates :file, presence: true
end
