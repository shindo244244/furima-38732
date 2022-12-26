## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| birthday           | text   | null: false               |

### Association

- has many: items
- has many: purchasers

## itemsテーブル

| Column     | Type      | Options                        |
| ---------- | ----------| ------------------------------ |
| item_name      | string    | null: false                    |     
| catch_copy | text      | null: false                    |
| concept    | text      | null: false                    |
| user       | reference | null: false, foreign_key: true |

### Association

- belongs_to : users 
- has many: comments

## commentsテーブル

| Column     | Type      | Options                        |
| ---------- | ----------| ------------------------------ |
| content    | text      | null: false                    |     
| prototype  | reference | null: false  foreign_key: true |
| user       | reference | null: false, foreign_key: true |

### Association

- belongs_to : users
- has many: prototype 
