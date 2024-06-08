# アプリケーション名

MITA


# アプリケーション概要

見た映画を記録し、カレンダー上に表示する映画記録アプリ。


# URL

https://mita-4zpg.onrender.com

* Basic認証ID：takahashi  
* Basic認証パスワード：1234


# テスト用アカウント

* メールアドレス：test@test  
* パスワード：test1234


# 利用方法

1 トップページのヘッダーからログイン、または新規登録を行う。  
2 映画見たよボタンを押して鑑賞した映画を登録する。  
3 トップページのカレンダーに登録した映画のタイトルが表示される。  
4 表示された映画タイトルを押すと登録した映画情報の詳細ページに移動する。  
5 詳細ページから編集と削除ができる。  


# アプリケーションを作成した背景

映画鑑賞が趣味だが、鑑賞記録を残さずに後日何を見たか忘れてしまうことが多かったため、鑑賞記録を残せるアプリを作成しようと思った。  
簡単に新規登録や鑑賞記録を書けるように、登録する情報は少なめに設定。感想・メモやイメージ画像も残したければ登録できるようにしたが必須にはせず、いつでも気軽に使用できるようにした。  
また、一ヶ月で何作見たかすぐに分かるようにトップページはカレンダーを配置し、見やすさを重視した。


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