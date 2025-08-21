#テーブル設計

## usersテーブル

| Column              | Type        | Options                     |
| ------------------- | ----------- | --------------------------- |
| nickname            | string      | null: false                 |
| email               | string      | null: false, unique: true   |
| password            | string      | null: false                 |
| enctrypted_password | string      | null: false                 |
| last_name           | string      | null: false                 |
| first_name          | string      | null: false                 |
| last_name_kana      | string      | null: false                 |
| first_name_kana     | string      | null: false                 |
| birth_year          | integer     | null: false                 |
| birth_month         | integer     | null: false                 |
| birth_day           | integer     | null: false                 |

### Association (users)
- has_many :items
- has_many :comments
- has_many :orders


## itemsテーブル

| Column              | Type        | Options                           |
| ------------------- | ----------- | --------------------------------- |
| image               | string      | null: false                       |
| name                | string      | null: false                       |
| description         | text        | null: false                       |
| category            | string      | null: false                       |
| condition           | string      | null: false                       |
| delivery_charge     | string      | null: false                       |
| region              | string      | null: false                       |
| shipping_days       | string      | null: false                       |
| price               | integer     | null: false                       |
| user_id             | references  | null: false, foreign_key: true    |

### Association (items)
- belongs_to :user
- has_many :comments
- has_many :orders


## ordersテーブル

| Column              | Type        | Options                           |
| ------------------- | ----------- | --------------------------------- |
| amount              | integer     | null: false                       |
| card_number         | string      | null: false                       |
| expiration_date     | string      | null: false                       |
| security_code       | string      | null: false                       |
| postal_code         | string      | null: false                       |
| delivery_charge     | string      | null: false                       |
| prefecture          | string      | null: false                       |
| city                | string      | null: false                       |
| address             | string      | null: false                       |
| building            | string      | null: true                        |
| phone               | string      | null: false                       |
| user_id             | references  | null: false, foreign_key: true    |
| item_id             | references  | null: false, foreign_key: true    |
| quantity            | integer     | null: false                       |

### Association (orders)
- belongs_to :user
- belongs_to :items


## commentsテーブル

| Column              | Type        | Options                           |
| ------------------- | ----------- | --------------------------------- |
| content             | text        | null: false                       |
| user_id             | references  | null: false, foreign_key: true    |
| item_id             | references  | null: false, foreign_key: true    |

### Association (comments)
- belongs_to :user
- belongs_to :item