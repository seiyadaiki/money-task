# README

- アプリケーション名          MoneyTask     
- アプリケーション概要        自分で使ったお金を管理し節約につなげる 
- URL                      https://money-task.herokuapp.com/
- テスト用アカウント          ID/kkk@gmail.com  Pass/seiya3521
- 利用方法                  ユーザー新規登録をしいつ、どこで、何に、いくら、どのように使ったのかを保存しトップページあるいはPurchase historyページで確認ができる
- 目指した課題解決            貯金をしたくても中々管理する事ができない人忙しくて簡単にお金の菅理をしたい人に簡潔にわかりやすくお金の管理ができる
- 洗い出した要件定義
機能：お金の支出管理機能 =>優先順位:高 所要時間:６

| 目的                                         | 詳細                               | ストーリー                                                      |
| ------------------------------------------- | -------------------------------   | ---------------------------------------------------------------|
| 自身の使ったお金の履歴をデータベース上に保存する為   | ActiveHash機能を使い選択肢を限定する | 購入したのがいつ、どこで、何を、どのように購入していくら使ったのかを保存する |

| 優先順位；高:3 中:2 小:1 | 機能            | 目的                                           | 詳細                                       | ストーリー
| 3                     | お金の支出表示機能 | データベースに保存したものを可視化しわかりやすくする為 | その購入履歴をクリックすると詳細にデータが出てくる |購入したものを上から順番に可視化できるようになり自分で何にお金を使っているのか明確化する 所要時間 :8
| 優先順位；高:3 中:2 小:1 | 機能           | 目的                                       | 詳細               | ストーリー 
| 2                     | ユーザー管理機能 | ユーザーを管理し、そのユーザーのみに情報を限定する | devise機能を実装する | ユーザーの情報はニックネームやパスワードを用いてログイン状態でなければ情報を閲覧できないようにする 所要時間 :3
| 優先順位；高:3 中:2 小:1 | 機能           | 目的                                                                | 詳細                        | ストーリー 
| 1                     | 貯金機能        | ゴールを決めてその月ごとで使ったお金に対して＋、ーの収支をつけて貯金ができる機能 | 購入履歴の使ったお金から参照する | 後いくら使えるか数字を可視化できる 所要時間 :10

- 実装した機能についてのGIFと説明
 ユーザー新規登録ができる
 https://gyazo.com/ea732024491f79f0d3575b88f94a624b
 使用したお金の情報を保存できる
 https://gyazo.com/a0c973aa90ad1a0fb3eb7f1733555653
 使用したお金の情報を閲覧できる
 https://gyazo.com/f029b5033eec44e75692efc51f8b00b9

- データベース設計
https://gyazo.com/5952c5d70c0802679156cc98e57b3f38

- ローカルでの動作方法
 cd money-task
 rails s
 rails _6.0.0_
 mysql

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