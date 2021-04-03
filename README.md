# アプリケーション名
MixApp

# アプリケーション概要
このアプリ一つでツイート動画投稿ブログ投稿ができるアプリケーション

# 目指した課題解決
このアプリケーションを使うことで、ブログをやっている動画配信者の方たちのコンテンツをスムーズに追うことができます。
今までは動画サイトからブログサイトに飛ぶときに非常にめんどくさい工程が必要でしたが、このアプリを使えばそんなことはなくなります。

# 要件定義
```ユーザー機能
ユーザー新規登録
ユーザーログアウト
ユーザーログイン
ユーザー情報編集機能
```

```投稿機能
ユーザー投稿機能(短文)
ユーザー投稿機能(動画)
ユーザー投稿機能(ブログ)
```

```グループ機能
グループをフォローしている人にはげんていでみれるこんてんつがある
グループ同士のフォロー機能
フォロー一覧表示機能

```
# 使用環境
Docker
Docker-compose 
Ruby on rails6
Ruby 2.6.5
Mac OS Big Sur (インテル版)

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| email    | string | null: false,unique: true |
| encrypted_password | string | null: false |
| nickname |string  | null: false |
| mania_histry|string  | null: false |
| enjoy_point |string  | null: false |

### Association

- has_many :posts
- has_many :likes
- has_many :movie_likes
- has_many :movie_comments
- has_many :comments
- has_many :blogs
- has_many :blog_likes
- has_many :blog_comments
  has_many :group_users
  has_many :groups, through: :group_users
## likes テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| post_id  | references | null: false, foreign_key: true ,unique: true |
| user_id  | references | null: false, foreign_key: true ,unique: true |

- belongs_to :post
- belongs_to :user

## movies テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| title    | string | null: false |
| introduction  | references | null: false, foreign_key: true ,unique: true |

- belongs_to :user
- belongs_to :movie_like


## movie_likes テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| movie_id  | references | null: false, foreign_key: true ,unique: true |
| user_id  | references | null: false, foreign_key: true ,unique: true |

- belongs_to :movie
- belongs_to :user

## posts テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| content  | text   | null: false  |
| user     | references | null: false, foreign_key: true |

- belongs_to :user


## comments テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| comment  | string | null: false  |
| user     | references | null: false, foreign_key: true |

### Association 

- belongs_to :post
- belongs_to :user

## movie_comments テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| movie_comment  | string | null: false  |
| user     | references | null: false, foreign_key: true |

### Association 

- belongs_to :movie
- belongs_to :user

## blogs テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| blog_content  | text | null: false  |
| title    | string | null: false  |

- belongs_to :user

## blog_likes テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| blog_id  | references | null: false, foreign_key: true  |
| user_id    | references | null: false, foreign_key: true  |

- belongs_to :user

## blog_comments テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| blog_id  | references | null: false, foreign_key: true |
| user_id  | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :blog

## groups テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
|  name    | string | null: false |
|  name    | index  | unique: true|

### Association
  has_many :group_users
  has_many :users, through: :group_users
  validates :name, presence: true, uniqueness: true

## group_user テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
|  group   | references | foreign_key: true |
|  user    | references  | foreign_key: true|

### Association 
  belongs_to :group
  belongs_to :user





















