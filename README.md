## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

has_many :items
has_many :comments
has_one :purchaser

## items テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| name             | string     | null: false |
| category         | string     | null: false |
| price            | string     | null: false |
| description      | string     | null: false |
| status           | string     | null: false |
| seller_name      | string     | null: false |
| region           | string     | null: false |
| shipping_date    | string     | null: false |
| image            | string     | null: false |
| shipping_charges | string     | null: false |
| user             | references | null: false |

has_one :purchaser
has_many :comments
belongs_to :user

## comments テーブル　

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| text   | string     | null: false |
| user   | references | null: false |
| item   | references | null: false |

belongs_to :users
belongs_to :items

## purchasers テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| last_name  | string     | null: false |
| first_name | string     | null: false |
| item       | references | null: false |
| user       | references | null: false |

has_one :shipping_address_information
belongs_to :user
belongs_to :item

## shipping_address_information テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| postal_code  | integer    | null: false |
| prefecture   | string     | null: false |
| address      | string     | null: false |
| building     | string     | null: false |
| phone_number | integer    | null: false |
| purchaser    | references | null: false |

belongs_to :purchaser
