FactoryBot.define do
  factory :transaction do
    amount { 1.5 }
    wallet { nil }
    cryptocurrency { nil }
  end
end
