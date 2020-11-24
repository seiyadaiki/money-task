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
- has_many :used_monies
- has_one  :goal

### used_moniesテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| date             | string     | null: false                    |
| location         | string     |                                |
| what             | string     |                                |
| way_id           | integer    | null: false                    |
| how_much         | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user

### goalsテーブル

| Column     | Type        | Options                        |
| ---------- | ----------- | ------------------------------ |
| saving     | integer     | null: false                    |
| user       | references  | null: false, foreign_key: true |

### Association
- belongs_to :user