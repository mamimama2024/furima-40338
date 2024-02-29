# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| last-name          | string  | null: false |
| first-name         | string  | null: false |
| last-name-kana     | string  | null: false |
| first-name-kana    | string  | null: false |
| birth_date(1i)     | integer | null: false |
| birth_date(2i)     | integer | null: false |
| birth_date(3i)     | integer | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                 | Type        | Options     |
| ---------------------- | ----------- | ----------- |
| name                   | string      | null: false |
| info                   | text        | null: false |
| category_id            | integer     | null: false |
| sales_status_id        | integer     | null: false |
| shipping_fee_status_id | integer     | null: false |
| prefecture_id          | integer     | null: false |
| scheduled_delivery_id  | integer     | null: false |
| price                  | integer     | null: false |
| user_id  | references | null: false, foreign_key: true |
| order_id | references | foreign_key: true              |

### Association

- has_one :order
- belongs_to :user

## orders テーブル

| Column       | Type       | Options                   |
| ------------ | ---------- | ------------------------- |
| postal_code  | integer    | null: false               |
| prefecture   | integer    | null: false               |
| city         | string     | null: false               |
| addresses    | string     | null: false               |
| building     | string     |                           |
| phone_number | integer    | null: false               |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user