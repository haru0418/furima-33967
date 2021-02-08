## users テーブル

| Column                 |Type     |Options                    |
|------------------------|---------|---------------------------|
| nickname               | string  | null: false               |
| email                  | string  | null: false, unique: true |
| encrypted_password     | string  | null: false               |
| first_name             | string  | null: false               |
| last_name              | string  | null: false               |
| first_name_kana        | string  | null: false               |
| last_name_kana         | string  | null: false               |
| birth_day              | date    | null: false               |


### Association
- has_many :items
- has_many :orders

## items テーブル

| Column               |Type        |Options            |
|----------------------|------------|-------------------|
| product              | string     | null: false       |
| product_description  | text       | null: false       |
| category_id          | integer    | null: false       |
| product_condition_id | integer    | null: false       |
| ship_burden_id       | integer    | null: false       |
| ship_city_id         | integer    | null: false       |
| ship_day_id          | integer    | null: false       |
| price                | integer    | null: false       |
| user                 | references | foreign_key: true |


### Association
belongs_to :user
has_one    :order

## orders テーブル

| Column  |Type        |Options            |
|---------|------------|-------------------|
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |


### Association
belongs_to :user
belongs_to :item
has_one :address

## addresses テーブル

| Column              |Type        |Options             |
|---------------------|------------|--------------------|
| post_code           | string     | null: false        |
| prefecture_id       | integer    | null: false        |
| prefecture_city     | string     | null: false        |
| prefecture_block    | string     | null: false        |
| prefecture_building | string     |                    |
| phone_number        | string     | null: false        |
| order               | references | foreign_key: true  |

### Association
belongs_to :orders