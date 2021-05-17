# アプリケーション名
MixApp

URL：http://13.208.108.131:3000

# アプリケーションのGIF

```
https://gyazo.com/1541e2ffc67b1a3747505724f9fe8e2f
https://gyazo.com/eb076d8f932c5e330c93d47535aa1e37
```

# アプリケーション概要
このアプリ一つでツイート動画投稿ブログ投稿ができるアプリケーション

# 目指した課題解決
このアプリケーションを使うことで、ブログをやっている動画配信者の方たちのコンテンツをスムーズに追うことができます。
今までは動画サイトからブログサイトに飛ぶときにプラットフォームの移動という非常にめんどくさい工程が必要でしたが、このアプリを使えばそんなことはなくなります。

# アプリケーションの機能一覧

```
ユーザー新規登録
ユーザーログアウト
ユーザーログイン
ユーザー情報編集機能
ユーザー投稿機能(短文と画像)
ユーザー投稿機能(動画)
ユーザー投稿機能(ブログと画像)
それぞれの投稿に対してユーザーは高評価が押せる
それぞれの投稿に対してコメントをできる
それぞれの投稿に対しての高評価の数が表示される
それぞれの投稿に対してコメントの数が表示される
もしも短文の投稿画面に動画を投稿しようとしてもバリデーションで弾かれてしまう
同様に動画投稿ページに画像を入れようとすると、バリデーションで弾かれてしまう。
ユーザー別の投稿一覧ページになっていてそのユーザーが投稿した全てのコンテンツの種類の内容を追うことができる(ログインしていないと見ることはできない。)
それぞれの投稿で一定の文字数を超えると一覧ページでは文字が丸めて表示されるようにしました。
    
```

# テストユーザーアカウント
```
Email:test2351@gmail.com
Password:wall2341
```


# 使用環境
- Docker 20.10.5
- Docker-compose 1.28.5
- Ruby on rails6
- Ruby 2.6.5
- Mac OS Big Sur (インテル版)
- AWS(EC2,S3,VPC)

# 使用したGemなど

```
ブログ投稿はActionText
そしてブログの投稿機能はscaffoldで作りました。
それぞれのファイルアップロードはActive Storage
Active Storageのバリデーションには、activestorage-validatorというGemを使いました。
ログイン機能はDeviceを使いました。

```
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
-  has_many :movie_liked_users, through: :movie_likes, source: :user
-  has_many :movie_likes
-  has_many :movie_comments, dependent: :destroy
-  belongs_to :user
-  has_many :movie_likes


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
- has_many :likes
- has_many :liked_users, through: :likes, source: :user
- has_many :comments, dependent: :destroy

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
| body     | text | null: false  |
| title    | string | null: false  |

### Association 
- belongs_to :user
- has_many :blog_comment,dependent: :destroy
- has_many :blog_likes
- has_many :blog_liked_users, through: :blog_likes, source: :user


## blog_likes テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| blog_id  | references | null: false, foreign_key: true  |
| user_id    | references | null: false, foreign_key: true  |

- belongs_to :user

## blog_comments テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
|blog_comment |string|null:false  |
| blog_id  | references | null: false, foreign_key: true |
| user_id  | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :blog




















