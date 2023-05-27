# FurimaのER図

## usersテーブル

| Column             | Type     | Option                    |
| ------------------ | -------- | ------------------------- |
| nickname           | string   | null: false               |
| password           | string   | null: false               |
| encrypted_password | string   | null: false               |
| email              | string   | null: false, unique: true |
| first_name         | string   | null: false               |
| last_name          | string   | null: false               |
| birthday           | datetime | null: false               |

- has_many :items
- has_many :orders

## itemsテーブル

| Column            | Type       | Option                         |
| ----------------- | ---------- | ------------------------------ |
| item_name         | string     | null: false                    | 
| explain           | text       | null: false                    |
| category          | string     | null: false                    |
| item_state        | string     | null: false                    |
| charge            | integer    | null: false                    |
| area              | string     | null: false                    |
| deliver_day       | integer    | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

- belongs_to :users
- belongs_to :orders

## ordersテーブル

| Column       | Type       | Option                         |
| ------------ | ---------- | ------------------------------ |
| zip_code     | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| build_name   | string     | null: false                    |
| address      | string     | null: false                    |
| phone_number | string     | null: false                    |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

- belongs_to :users
- belongs_to :items
- has_one :delivers

## deliversテーブル

| Column       | Type       | Option                         |
| ------------ | ---------- | ------------------------------ |
| zip_code     | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| build_name   | string     | null: false                    |
| address      | string     | null: false                    |
| phone_number | string     | null: false                    |

- belongs_to :orders
