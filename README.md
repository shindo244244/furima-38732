## usersテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| family_name        | string  | null: false               |
| first_name         | string  | null: false               |
| family_name_kana   | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has many: items
- has many: purchase_records

## itemsテーブル

| Column          | Type      | Options                        |
| --------------- | ----------| ------------------------------ |
| item_name       | string    | null: false                    |
| explain         | text      | null: false                    |
| category        | integer   | null: false                    |
| state           | integer   | null: false                    |
| delivery_charge | integer   | null: false                    |
| area            | integer   | null: false                    |
| days            | integer   | null: false                    |
| price           | integer   | null: false,                   |
| user_id         | reference | null: false, foreign_key: true |

### Association

- belongs_to : users 
- has_one: purchase_records

## purchase_recordsテーブル

| Column     | Type      | Options                        |
| ---------- | ----------| ------------------------------ | 
| user_id    | reference | null: false  foreign_key: true |
| item_id    | reference | null: false, foreign_key: true |

### Association

- belongs_to : users
- belongs_to : items
- has_one: delivery_addresses

## delivery_addressesテーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| postal_code        | string    | null: false                    |
| prefectures        | integer   | null: false                    |
| municipalities     | string    | null: false                    |
| address            | string    | null: false                    |
| building           | string    |                                |
| phone_number       | integer   | null: false                    |
| purchase_record_id | reference | null: false, foreign_key: true |

### Association

- belongs_to: purchase_records
