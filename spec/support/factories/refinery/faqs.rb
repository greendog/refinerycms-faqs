
FactoryGirl.define do
  factory :faq, :class => Refinery::Faqs::Faq do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

