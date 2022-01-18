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
| image                | string     | null: false                   |
| name                 | string     | null: false                   |
| explanation          | text       | null: false                   |
| category             | string     | null: false                   |
| item_condition       | string     | null: false                   |
| postage_player       | string     | null: false                   |
| postage_area         | string     | null: false                   |
| preparation_day      | integer    | null: false                   |
| seller               | references | null: false foreign_key: true |
| user                 | references | null: false foreign_key: true |

##アソシエーション
- belongs_to :user
- has_one :order

##ordersテーブル

|        Column        |    Type    |            Options            |
| -------------------- | ---------- | ----------------------------- |
| what_bought          | string     | null: false                   |
| buyer                | references | null: false foreign_key: true |
| user                 | references | null: false foreign_key: true |

##アソシエーション
- belongs_to :item
- has_one :address

##addressesテーブル

|        Column        |  Type   |         Options          |
| -------------------- | ------- | ------------------------ |
| post_code            | integer | null: false              |
| prefectures          | string  | null: false              |
| municipalities       | string  | null: false              |
| street_number        | string  | null: false              |
| building_name        | string  |                          |
| telephone_number     | integer | null: false              |

##アソシエーション
- belongs_to :order