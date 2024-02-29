# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday           | date    | null: false |

### Association

- has_many :items
- has_many :orders
_ has_one :address


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
| user | references | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :user


## orders テーブル

| Column       | Type       | Options                   |
| ------------ | ---------- | ------------------------- |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address


## addresses テーブル

| Column        | Type       | Options                   |
| ------------- | ---------- | ------------------------- |
| postal_code   | integer    | null: false               |
| prefecture_id | integer    | null: false               |
| city          | string     | null: false               |
| addresses     | string     | null: false               |
| building      | string     |                           |
| phone_number  | integer    | null: false               |
| order    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order