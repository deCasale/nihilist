FactoryGirl.define do
  factory :user, :class => Admin::User do
    login 'admin'
    email 'admin@nihilist.cz'
    password 'lopata123'
  end
end
