# README

### usersテーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false |
| encrypted_password  | string  | null: false |
| name                | string  | null: false |
| name_kana           | string  | null: false |
| birthday            | date    | null: false |

### Association
- has_many :
- has_one  :orders

### itemsテーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ------------------------------|
| title            | string     | null: false                   |
| explanation      | text       | null: false                   |
| category_id      | integer    | null: false                   |
| status_id        | integer    | null: false                   |
| shipping_fee_id  | integer    | null: false                   |
| location_id      | integer    | null: false                   |
| delivery_time_id | integer    | null: false                   |
| selling_price    | integer    | null: false                   |
| user             | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :order

### ordersテーブル

| Column | Type        | Options                        |
| -------| ----------- | ------------------------------ |
| user   | references  | null: false, foreign_key: true |
| item   | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :adress

### addressesテーブル