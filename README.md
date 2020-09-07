# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| family_name       | string | null: false |
| first_name        | string | null: false |
| family_name_kana  | string | null: false |
| first_name_kana   | string | null: false |
| birth             | date   | null: false |

### Association

- has_many :items
- has_many :shops

## items テーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| image    | string  | null: false |
| name     | string  | null: false |
| info     | string  | null: false |
| category | integer | null: false |
| status   | integer | null: false |
| fee      | integer | null: false |
| place    | integer | null: false |
| days     | integer | null: false |
| price    | integer | null: false |

### Association

- belongs_to :user
- has_one :shop

## shops テーブル

| Column    | Type       | Options                        |
| ----------| ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column      | Type     | Options       |
| ------------| -------- | ------------- |
| post_number | integer  | null: false   |
| prefecture  | integer  | null: false   |
| city        | string   | null: false   |
| street      | string   | null: false   |
| building    | string   |               |
| tell_number | integer  | null: false   |

### Association

- belongs_to :shop