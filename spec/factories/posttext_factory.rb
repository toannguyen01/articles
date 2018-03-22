FactoryBot.define do 
  factory :posttext do
    headline  '123'
    content '123'
    article_id { create(:article).id } 
  end
end