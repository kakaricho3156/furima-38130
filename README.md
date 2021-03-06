# README

## users テーブル




| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           |  date  | null: false |
| encrypted_password | string | null: false |




### Association  users テーブル

- has_many :items
- has_many :buying_items
- 

## items テーブル


| Column            |  Type   | Options                       |
| ------------------| ------  | -----------                   |
| item_name         | string  | null: false                   |
| item_detail       |  text   | null: false                   |
| category_id       | integer | null: false                   |
| condition_id      | integer | null: false                   |
| delivery_charge_id| integer | null: false                   |
| prefecture_id     | integer | null: false                   |
| days_to_ship_id   | integer | null: false                   |
| price             | integer | null: false                   |
| user              |references| null: false , foreign_key:true|


### Association  items テーブル

- belongs_to :user
- has_one :buying_item


## buying_items テーブル

| Column            |  Type   | Options                       |
| ------------------| ------  | -----------                   |
| item              |references| null: false                   |
| user              |references| null: false , foreign_key:true|


### Association  buying_items テーブル
- has_one :information
- belongs_to:item
- belongs_to:user

## information テーブル

| Column            |  Type   | Options                       |
| ------------------| ------  | -----------                   |
| post_number       |  string | null: false                   |
| prefecture     | string  | null: false                   |
| town              |  string | null: false                   |
| address           | string | null: false                    |
| building          | string | null: false                    |
| telephone         | string | null: false                    |
| buying_item       |references| null: false , foreign_key:true|


### Association information テーブル
- 
-
- belongs_to:buying_item