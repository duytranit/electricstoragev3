class Project < ActiveRecord::Base
  belongs_to :user
  belongs_to :procategory

  has_many :attachments, dependent: :destroy
  has_many :items

  has_attached_file :photo, :styles => { :medium => "470x140>", :thumb => "224x140>" }, :default_url => "/images/:style/missing.png", dependent: :destroy
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

end
