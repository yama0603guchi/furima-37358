FactoryBot.define do
  factory :item do
    name                {"商品名"}
    price               {2000}
    explanation         {"商品説明"}
    category_id         {2}
    item_condition_id   {2}
    postage_player_id   {2}
    postage_area_id     {2}
    preparation_day_id  {2}

    association :user

    after(:build) do |item|
      item.image.attach(io:File.open('app/assets/images/star.png'), filename: 'star.png')
    end
  end
end
