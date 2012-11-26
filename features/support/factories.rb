FactoryGirl.define do
  factory :user, :class => Admin::User do
    login 'admin'
    email 'admin@nihilist.cz'
    password 'lopata123'
  end

  factory :comic do
  	sequence(:title){|n| "I am comic number #{Comic.count + 1}"}
  end
end
