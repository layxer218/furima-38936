# FurimaのER図

## usersテーブル

| Column             | Type     | Option                    |
| ------------------ | -------- | ------------------------- |
| nickname           | string   | null: false               |
| encrypted_password | string   | null: false               |
| email              | string   | null: false, unique: true |
| first_name         | string   | null: false               |
| first_name_kana    | string   | null: false               |
| last_name          | string   | null: false               |
| last_name_kana     | string   | null: false               |
| birthday           | date     | null: false               |

- has_many :items
- has_many :orders

## itemsテーブル

| Column            | Type       | Option                         |
| ----------------- | ---------- | ------------------------------ |
| item_name         | string     | null: false                    | 
| explain           | text       | null: false                    |
| category_id       | integer    | null: false                    |
| item_state_id     | integer    | null: false                    |
| charge_id         | integer    | null: false                    |
| area_id           | integer    | null: false                    |
| deliver_day_id    | integer    | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

- belongs_to :user
- has_one :order

## ordersテーブル

| Column       | Type       | Option                         |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :delivers

## deliversテーブル

| Column       | Type       | Option                         |
| ------------ | ---------- | ------------------------------ |
| zip_code_id  | integer    | null: false                    |
| area_id      | integer    | null: false                    |
| city         | string     | null: false                    |
| build_name   | string     |                                |
| address      | string     | null: false                    |
| phone_number | string     | null: false                    |

- belongs_to :order
