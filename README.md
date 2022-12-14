## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

has_many :items
has_many :comments
has_many :purchasers

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| category_id        | integer    | null: false                    |
| price              | integer    | null: false                    |
| description        | text       | null: false                    |
| status_id          | integer    | null: false                    |
| region_id          | integer    | null: false                    |
| shipping_date_id   | integer    | null: false                    |
| shipping_charge_id | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

has_one :purchaser
has_many :comments
belongs_to :user

## comments テーブル　

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| text   | string     | null: false |
| user   | references | null: false |
| item   | references | null: false |

belongs_to :user
belongs_to :item

## purchasers テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

has_one :shipping_address
belongs_to :user
belongs_to :item

## shipping_addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| region_id    | integer    | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |
| purchaser    | references | null: false, foreign_key: true |

belongs_to :purchaser
