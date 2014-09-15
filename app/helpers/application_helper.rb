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
end
