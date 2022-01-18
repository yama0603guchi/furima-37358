# README

##usersテーブル

|        Column        |  Type  |         Options          |
| -------------------- | ------ | ------------------------ |
| nickname             | string | null: false              |
| email                | string | null: false unique: true |
| encrypted_password   | string | null: false              |
| first_name           | string | null: false              |
| family_name          | string | null: false              |
| first_name_kana      | string | null: false              |
| family_name_kana     | string | null: false              |
| birth_day            | date   | null: false              |

##アソシエーション
- has_many :items
- has_many :orders

##itemsテーブル

|        Column        |    Type    |            Options            |
| -------------------- | ---------- | ----------------------------- |
| price                | integer    | null: false                   |
| name                 | string     | null: false                   |
| explanation          | text       | null: false                   |
| category_id          | integer    | null: false                   |
| item_condition_id    | integer    | null: false                   |
| postage_player_id    | integer    | null: false                   |
| postage_area_id      | integer    | null: false                   |
| preparation_day_id   | integer    | null: false                   |
| user                 | references | null: false foreign_key: true |

##アソシエーション
- belongs_to :user
- has_one :order

##ordersテーブル

|        Column        |    Type    |            Options            |
| -------------------- | ---------- | ----------------------------- |
| item                 | references | null: false foreign_key: true |
| user                 | references | null: false foreign_key: true |

##アソシエーション
- belongs_to :user
- belongs_to :item
- has_one :address

##addressesテーブル

|        Column        |    Type    |            Options            |
| -------------------- | ---------- | ----------------------------- |
| post_code            | string     | null: false                   |
| postage-area_id      | integer    | null: false                   |
| municipalities       | string     | null: false                   |
| street_number        | string     | null: false                   |
| building_name        | string     |                               |
| telephone_number     | string     | null: false                   |
| order                | references | null: false foreign_key: true |

##アソシエーション
- belongs_to :order