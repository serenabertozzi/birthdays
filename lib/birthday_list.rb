require "date"

class BirthdayList
  attr_reader :birthdays

  def initialize
    @birthdays = []
  end

  def add_birthday(name, birthday)
    @birthdays << { name: name, date: birthday }
  end

  def show_list
    list = @birthdays.map { |person| "#{person[:name]}: #{person[:date]}" }
    list.join("\n")
  end

  def daily_birthday
    @birthdays.each do |person|
      day_and_month = Date.parse(person[:date]).strftime("%d/%m")
      time = Time.now.strftime("%d/%m")
      age_today = calculate_age(person[:date])
      if time == day_and_month
        return "It's #{person[:name]}'s birthday today!They are #{age_today} years old!"
      end
    end
  end

  private

  def calculate_age(birthday_date)
    parsed_date = Date.parse(birthday_date)
    age = (Time.new.year) - parsed_date.year
  end
end
