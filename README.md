# README

# アプリケーション名

tripnote

# アプリケーション概要

旅行の写真の投稿、旅行先の情報共有

# URL

https://trip-note-29613.herokuapp.com/


# テスト用アカウント

* メールアドレス: sample@gmail.com
* password: a123456

# 利用方法

新規登録し、旅行で撮った写真を投稿してください。
投稿一覧から他のユーザーの投稿を見ることができます。
気になった投稿は詳細を見るをクリックするとコメントをすることができます。
ご自身の投稿内容についてはマイページから編集と削除が可能です。

# 目指した課題解決

旅行に慣れていない人が旅行先の情報を事前に簡単に知ることができるようにしたいという思いからこのアプリを作成しました。

# 洗い出した要件


|機能             |目的                                           |詳細                                                          |
|----------------｜----------------------------------------------|ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー---|  
|ユーザー管理機能   |新規登録ログイン機能を実装すること                  |device機能を用いて新規登録とログインができるようにする。              |
|写真投稿機能      |active storageを利用した写真投稿機能を実装すること。 |ユーザーは一枚の写真とその写真の説明やカテゴリーが投稿できるようにする。 ｜
|コメント機能      | コメント投稿機能を実装すること                     |投稿された内容に対してコメントができるようにする。                   |
|マイページ閲覧機能 | ユーザーのプロフィール情報を表示する                |ユーザー名をクリックするとプロフィールが閲覧できるようにする。         |
 

# データベース設計

![ER図](https://user-images.githubusercontent.com/71625568/112399625-e9d34c00-8d49-11eb-8d5d-c3855aad6cda.png)

## Usersテーブル

|Column                |   Type     |Options                  |
|----------------------|------------|-------------------------|
| nickname             | string     |null: false              |
| email                | string     |null: false, unique: true|
| encrypted_password   | string     |null: false              |
| birthday             | date       |null: false              |

### Association
- has_many :articles
- has_many :comments
- has_one :profile


## Articlesテーブル
|Column                |    Type         |Options                         |
|----------------------|-----------------|--------------------------------|
| instruction          | text            |null: false                     |
| category_id          | integer         |null: false                     |
| country_id           | integer         |null: false                     | 
| user                 | references      |null: false, foreign_key: true  |

### Association
 - belongs_to :user
 - has_many :comments


 ## Commentsテーブル
|Column                |    Type         |Options                         |
|----------------------|-----------------|--------------------------------|
| text                 | text            |null: false                     |
| user                 | references      |null: false, foreign_key: true  |
| article                | references      |null: false, foreign_ket: true  |

### Association
- belongs_to user
- belongs_to article




 ## Profilesテーブル
|Column                |    Type         |Options                         |
|----------------------|-----------------|--------------------------------|
| instruction          | text            |null: false                     |
| travel_history       | text            |null: false                     |
| user                 | references      |null: false, foreign_key: true  |

### Association
- belongs_to :user
