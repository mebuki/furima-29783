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

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| name1    | string | null: false |
| name2    | string | null: false |
| birth    | string | null: false |

### Association

- has_many :items
- has_many :shops

## items テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| image    | string | null: false |
| item_name| string | null: false |
| item_info| string | null: false |
| category | string | null: false |
| status   | string | null: false |
| price    | string | null: false |

### Association

- belongs_to :user
- belongs_to :shop

## shops テーブル

| Column        | Type     | Options     |
| --------------| -------- | ----------- |
| card_number   | string   | null: false |
| card_date     | string   | null: false |
| security_code | string   | null: false |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column      | Type     | Options       |
| ------------| -------- | ------------- |
| post_number | string   | null: false   |
| prefecture  | string   | null: false   |
| city        | string   | null: false   |
| street      | string   | null: false   |
| building    | string   | null: false   |
| tell_number | string   | null: false   |

### Association

- belongs_to :shop