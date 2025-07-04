FactoryBot.define do
  factory :comment do
    content { 'este es mi comentario' }
    association :user
    association :post
  end
end
