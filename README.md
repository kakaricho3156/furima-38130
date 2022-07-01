# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user_id            |integer | null: false |
| nickname           | string | null: false |
| email              | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday_year      | string | null: false |
| birthday_month     | string | null: false |
| birthday_day       | string | null: false |
| encrypted_password | string | null: false |
|password_confirmation| string | null: false |




### Association

- has_many :items
- has_many :buying_items
- has_many :information

## items テーブル

| Column            |  Type   | Options                       |
| ------------------| ------  | -----------                   |
| item_id           | integer | null: false                   |
| item_image        |  text   | null: false                   |
| item_name         | string  | null: false                   |
| item_detail       |  text   | null: false                   |
| item_category     | string  | null: false                   |
| item_condition    | string  | null: false                   |
| item_charge       | string  | null: false                   |
| delivery_charge   | string  | null: false                   |
| shipping_area     | string  | null: false                   |
| days_to_ship      | string  | null: false                   |
| price             | string  | null: false                   |
| user_id           |reference| null: false , foreign_key:true|


### Association

- belongs_to :user
- has_many :buying_items
- has_many :information, through: :buying_items


## buying_items テーブル

| Column            |  Type   | Options                       |
| ------------------| ------  | -----------                   |
| item_id           |reference| null: false                   |
| user_id           |reference| null: false , foreign_key:true|


### Association
- has_many :information
- belongs_to:user
- belongs_to:item

| Column            |  Type   | Options                       |
| ------------------| ------  | -----------                   |
| post_number       | integer | null: false                   |
| prefectures       |  string | null: false                   |
| town              |  string | null: false                   |
| address           |  text   | null: false                   |
| building          |  text   | null: false                   |
| telephone         | integer | null: false                   |

### Association
- 
- belongs_to:user
- belongs_to:item
- belongs_to:buying_items