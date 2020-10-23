# テーブル設計

## users テーブル

| Column           | Type     | Options     |
| --------         | ------   | ----------- |
| nickname         | string   | null: false |
| email            | string   | null: false |
| password         | string   | null: false |
| last_name        | string   | null: false |
| first_name       | string   | null: false |
| last_name_kana   | string   | null: false |
| first_name_kana  | string   | null: false |
| birth_date       | datetime | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                   | Type       | Options           |
| ------                   | ------     | -----------       |
| item_name                | string     | null: false       |
| item_info                | text       | null: false       |
| item_category            | string     | null: false       |
| item_sales_status        | string     | null: false       |
| item_shipping_fee_status | string     | null: false       |
| item_prefecture          | string     | null: false       |
| item_scheduled_delivery  | datetime   | null: false       |
| item_price               | integer    | null: false       |
| user                     | references | foreign_key: true |

### Association

- belongs_to :user
- has_one    :order

## orders テーブル

| Column        | Type       | Options           |
| -------       | ---------- | ----------------- |
| postal_code   | integer    | null: false       |
| prefecture    | string     | null: false       |
| city          | string     | null: false       |
| addresses     | integer    | null: false       |
| building      | string     |                   |
| phone_number  | integer    | null: false       |
| user          | references | foreign_key: true |
| item          | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item