## users テーブル

| Column                 |Type     |Options      |
|------------------------|---------|-------------|
| nickname               | string  | null: false, unique: true |
| email                  | string  | null: false               |
| password               | string  | null: false               |
| password_confirmation  | string  | null: false               |
| first_name             | string  | null: false               |
| last_name              | string  | null: false               |
| first_name_kana        | string  | null: false               |
| last_name_kana         | string  | null: false               |
| birth_day              | integer | null: false               |
| birth_month            | integer | null: false               |
| birth_year             | integer | null: false               |


### Association
- has_many :items
- has_many :orders

## items テーブル

| Column               |Type        |Options            |
|----------------------|------------|-------------------|
| product              | text       | null: false       |
| product_description  | text       | null: false       |
| category             | integer    | null: false       |
| product_condition    | integer    | null: false       |
| ship_burden          | integer    | null: false       |
| ship_city            | integer    | null: false       |
| ship_day             | integer    | null: false       |
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

| Column          |Type        |Options             |
|-----------------|------------|--------------------|
| card_number     | integer    | null: false        |
| exp_month       | integer    | null: false        |
| exp_year        | integer    | null: false        |
| post_code       | integer    | null: false        |
| prefecture      | integer    | null: false        |
| city            | text       | null: false        |
| block           | text       | null: false        |
| building        | text       |                    |
| phone_number    | integer    | null: false        |
| order           | references | foreign_key: true  |

### Association
has_many :orders