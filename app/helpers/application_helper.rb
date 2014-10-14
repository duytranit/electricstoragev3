module ApplicationHelper
  def format_date(datetime)
    day = datetime.day
    month = datetime.month
    year = datetime.year

    if cookies[:locale] == 'vi'
      day = '0' + day.to_s if day < 10
      month = '0' + month.to_s if month < 10
      return day.to_s + '-' + month.to_s + '-' + year.to_s
    else
      return month.to_s + '-' + day.to_s + '-' + year.to_s
    end
  end

	def sequence_number(page, per_page)
		if page && Integer(page) > 1
			number = (Integer(page) - 1) * per_page + 1
		else
			number = 1
		end
		number
	end

  def current_cart(customer_id)
	  customer = User.find(customer_id)
	  invoice = Invoice.where(["user_id = ? and payment = ''", customer_id])
	  invoice = customer.invoices.create if !invoice
	  return invoice
  end
end
