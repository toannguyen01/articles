FactoryBot.define do 
  factory :postimage do
    headline  '123'
    article_id { create(:article).id } 
  end
end