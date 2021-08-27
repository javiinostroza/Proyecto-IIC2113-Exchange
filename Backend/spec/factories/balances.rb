FactoryBot.define do
  factory :balance do
    amount { 1.5 }
    wallet { nil }
    market { nil }
    cryptocurrency { nil }
  end
end
