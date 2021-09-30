require "birthday_list"

describe BirthdayList do
  it { is_expected.to respond_to(:add_birthday).with(2).argument }

  it "stores a birthday" do
    subject.add_birthday("Serena", "16/06/1989")
    expect(subject.birthdays).not_to be_empty
  end

  it "stores a birthday" do
    subject.add_birthday("Serena", "16/06/1989")
    subject.add_birthday("Eu", "14/03/1990")
    expect(subject.birthdays).to eq([{ name: "Serena", date: "16/06/1989" }, { name: "Eu", date: "14/03/1990" }])
  end

  it "display a birthday as an item of list" do
    subject.add_birthday("Serena", "16/06/1989")
    expect(subject.show_list).to eq("Serena: 16/06/1989")
  end

  it "shows a list of birthdays" do
    subject.add_birthday("Serena", "16/06/1989")
    subject.add_birthday("Eu", "14/03/1990")
    expect(subject.show_list).to eq("Serena: 16/06/1989\nEu: 14/03/1990")
  end

  # it "shows a daily birthday" do
  #   subject.add_birthday("Gino", "30/09/2000")
  #   expect(subject.daily_birthday).to eq ("It's Gino's birthday today!")
  # end

  it "shows a daily birthday and age" do
    subject.add_birthday("Gino", "30/09/2000")
    expect(subject.daily_birthday).to eq ("It's Gino's birthday today!They are 21 years old!")
  end
end
