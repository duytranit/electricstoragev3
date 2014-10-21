class Project < ActiveRecord::Base
  belongs_to :user
  belongs_to :procategory

  has_many :attachments, dependent: :destroy
  has_many :items

  has_attached_file :photo, :styles => { :medium => "470x140>", :thumb => "224x140>" }, :default_url => "/images/:style/missing.png", dependent: :destroy
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  def is_bought?(customer_id)
    customer = User.find(customer_id)
    current_cart = Invoice.where(["user_id = ? AND payment IS NULL", customer_id]).first
    flag = false
    current_cart.items.each do |item|
      if item.project_id == self.id
        flag = true
        break
      end
    end if current_cart
    return flag
  end

  def self.search(title, description, procategory_id)
	  title = title.downcase if title
	  description = description.downcase if description
	  if procategory_id != ''
		  self.where(["LOWER(projects.title) LIKE ? and LOWER(projects.description) LIKE ? and projects.procategory_id = ?", "%#{title}%", "%#{description}%", procategory_id])
	  else
		  self.where(["LOWER(projects.title) LIKE ? and LOWER(projects.description) LIKE ?", "%#{title}%", "%#{description}%"])
	  end
  end

end
