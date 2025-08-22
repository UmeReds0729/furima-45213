#テーブル設計

## usersテーブル

| Column              | Type        | Options                     |
| ------------------- | ----------- | --------------------------- |
| nickname            | string      | null: false                 |
| email               | string      | null: false, unique: true   |
| enctrypted_password | string      | null: false                 |
| last_name           | string      | null: false                 |
| first_name          | string      | null: false                 |
| last_name_kana      | string      | null: false                 |
| first_name_kana     | string      | null: false                 |
| birthday            | date        | null: false                 |

### Association (users)
- has_many :items
- has_many :orders


## itemsテーブル

| Column              | Type        | Options                           |
| ------------------- | ----------- | --------------------------------- |
| name                | string      | null: false                       |
| description         | text        | null: false                       |
| category_id         | integer     | null: false                       |
| condition_id        | integer     | null: false                       |
| delivery_charge_id  | integer     | null: false                       |
| region_id           | integer     | null: false                       |
| shipping_days_id    | integer     | null: false                       |
| price               | integer     | null: false                       |
| user                | references  | null: false, foreign_key: true    |

### Association (items)
- belongs_to :user
- belongs_to :order


## ordersテーブル

| Column              | Type        | Options                           |
| ------------------- | ----------- | --------------------------------- |
| amount              | integer     | null: false                       |
| card_number         | integer     | null: false                       |
| expiration_date     | string      | null: false                       |
| security_code       | integer     | null: false                       |
| shipping_address_id | references  | null: false, foreign_key: true    |
| user                | references  | null: false, foreign_key: true    |
| item_id             | references  | null: false, foreign_key: true    |
| quantity            | integer     | null: false                       |

### Association (orders)
- belongs_to :user
- belongs_to :item
- belongs_to :shipping_address


## shipping_addressesテーブル

| Column              | Type        | Options                           |
| ------------------- | ----------- | --------------------------------- |
| postal_code         | integer     | null: false                       |
| prefecture_id       | integer     | null: false                       |
| city                | string      | null: false                       |
| address             | string      | null: false                       |
| building            | string      | null: false, foreign_key: true    |
| phone               | integer     | null: false, foreign_key: true    |
| order_id            | references  | null: false, foreign_key: true    |

### Association (shipping_addresses)
- belongs_to :order
