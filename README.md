## users テーブル

| Column                 |Type     |Options      |
|------------------------|---------|-------------|
| nickname               | string  | null: false, unique: true |
| email                  | string  | null: false, unique: true |
| password               | string  | null: false               |
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
| product              | text       | null: false       |
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
belongs_to :address

## address テーブル

| Column              |Type        |Options             |
|---------------------|------------|--------------------|
| post_code           | integer    | null: false        |
| prefecture_id       | integer    | null: false        |
| prefecture_city     | text       | null: false        |
| prefecture_block    | text       | null: false        |
| prefecture_building | text       |                    |
| phone_number        | integer    | null: false        |
| order               | references | foreign_key: true  |

### Association
has_many :orders