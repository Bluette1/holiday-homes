FactoryBot.define do
  factory :user, aliases: %i[creator] do
    name { 'name' }
    username { 'username' }
    email { 'email@web.com' }
    password { 'password' }
  end
end
