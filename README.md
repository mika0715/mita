# DB 設計

https://gyazo.com/58b7f5997d7df1cd85852d949c6b477e

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
| start_time         | datetime   | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

* belongs_to :user