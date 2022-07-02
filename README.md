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
- has_many :information

## items テーブル


| Column            |  Type   | Options                       |
| ------------------| ------  | -----------                   |
| item_name         | string  | null: false                   |
| item_detail       |  text   | null: false                   |
| item_category_id  | integer | null: false                   |
| item_condition_id | integer | null: false                   |
| item_charge_id    | integer | null: false                   |
| delivery_charge_id| integer | null: false                   |
| shipping_area_id  | integer | null: false                   |
| days_to_ship      | string  | null: false                   |
| price             | integer | null: false                   |
| user              |references| null: false , foreign_key:true|


### Association  items テーブル

- belongs_to :user
- has_one :buying_items
- has_many :information, through: :buying_items


## buying_items テーブル

| Column            |  Type   | Options                       |
| ------------------| ------  | -----------                   |
| item              |references| null: false                   |
| user              |references| null: false , foreign_key:true|


### Association  buying_items テーブル
- has_many :information
- belongs_to:user
- belongs_to:item

## information テーブル

| Column            |  Type   | Options                       |
| ------------------| ------  | -----------                   |
| post_number       |  string | null: false                   |
| shipping_area     | string  | null: false                   |
| town              |  string | null: false                   |
| address           |  string | null: false                   |
| building          |  string |                               |
| telephone         |  string | null: false                   |

### Association information テーブル
- 
- belongs_to:user
- belongs_to:item
- belongs_to:buying_item