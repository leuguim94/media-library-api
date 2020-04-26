# == Schema Information
#
# Table name: movies
#
#  id         :integer          not null, primary key
#  title      :string
#  plot       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :movie do
    title { 'Inception' }
    plot { 'Dominic Cobb is an skilled thief, stealing data from his target through their dreams. Cobb is also a fugitive who misses his children. Someone approaches Cobb and wants to hire him but instead of getting information out, the man wants Cobb to implant something, a process called Inception. When the man offers to help Cobb go back to his children, Cobb agrees.' }
  end
end
