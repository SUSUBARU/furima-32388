# テーブル設計

## users テーブル

| Column               | Type    | Options     |
| -------------------- | ------  | ----------- |
| nickname             | string  | null: false |ニックネーム
| email                | string  | null: false |メールアドレス
| encrypted_password   | string  | null: false |パスワード
| last_name            | string  | null: false |お名前姓(全角)
| first_name           | string  | null: false |お名前名(全角)
| last_name_reading    | string  | null: false |お名前姓カナ(全角)
| first_name_reading   | string  | null: false |お名前名カナ(全角)
| birthday             | date    | null: false |生年月日

### Association

- has_many :items
- has_many :buy, through: user_buys
- has_many :user_buys

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ | 
| item_name              | string     | null: false                    |商品名
| explain                | text       | null: false                    |商品の説明
| category_id            | integer    | null: false                    |カテゴリー
| state_id               | integer    | null: false                    |商品の状態
| burden_id              | integer    | null: false                    |配送料の負担
| delivery_source_id     | integer    | null: false                    |発送元の地域
| delivery_date_id       | integer    | null: false                    |発送までの日数
| price                  | integer    | null: false                    |販売価格
| user                   | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one    :buy

# buys テーブル

| Column                    | Type        | Options                        |
| ------------------------- | ----------- | ------------------------------ |
| postal_code               | integer     | null: false                    |郵便番号
| prefecture                | integer     | null: false                    |都道府県
| city                      | string      |                                |市町村
| house_number              | string      |                                |番地
| building_name             | string      |                                |建物名
| phone_number              | integer     | null: false                    |電話番号


### Association

- belongs_to :user, through: user_buys
- belongs_to :item
- has_many :user_buys

## user_buys テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| buy    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :buy