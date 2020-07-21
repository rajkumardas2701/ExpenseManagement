FactoryBot.define do
  factory :expense do
    name { 'testname' }
    amount { 500 }
    createdAt { 2020 - 10 - 22 }
    User_id { 1 }
  end
end
