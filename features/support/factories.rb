FactoryGirl.define do
  factory :user, :class => Admin::User do
    login 'admin'
    email 'admin@nihilist.cz'
    password 'lopata123'
  end

  factory :comic do
  	sequence(:title){|n| "I am comic number #{Comic.count + 1}"}
    image File.open('features/test_files/nighthawk.jpeg')
  end
end
