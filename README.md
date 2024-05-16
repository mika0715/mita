# アプリケーション名

MITA

# アプリケーション概要

見た映画を記録し、カレンダー上に表示する映画記録アプリ。

# URL

https://mita-4zpg.onrender.com

* Basic認証ID：takahashi  
* Basic認証パスワード：1234

# テスト用アカウント

* メールアドレス：a@a  
* パスワード：test1234

# DB設計

![58b7f5997d7df1cd85852d949c6b477e](https://github.com/mika0715/mita/assets/162863614/deb93232-91e8-4792-bc6e-8679db66396f)


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