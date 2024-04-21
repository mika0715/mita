# DB 設計

## users table

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| name               | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |


### Association

* has_many :movies


## movies table

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| title              | string     | null: false                    |
| memo               | text       |                                |
| theater_id         | integer    | null: false                    |
| expense            | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

* belongs_to :user