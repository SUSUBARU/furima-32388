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
- has_many :user_items

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ | 
| name                   | string     | null: false                    |商品名
| explain                | text       | null: false                    |商品の説明
| category_id            | integer    | null: false                    |カテゴリー
| state_id               | integer    | null: false                    |商品の状態
| burden_id              | integer    | null: false                    |配送料の負担
| prefecture_id          | integer    | null: false                    |発送元の地域
| delivery_date_id       | integer    | null: false                    |発送までの日数
| price                  | integer    | null: false                    |販売価格
| user                   | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one    :user_items

# buys テーブル

| Column                    | Type        | Options                        |
| ------------------------- | ----------- | ------------------------------ |
| postal_code               | string      | null: false                    |郵便番号
| prefecture_id             | integer     | null: false                    |都道府県
| city                      | string      | null: false                    |市町村
| house_number              | string      | null: false                    |番地
| building_name             | string      | null: false                    |建物名
| phone_number              | string      | null: false                    |電話番号
| user_items                | references  | null: false, foreign_key: true |


### Association

- belongs_to :user_items


## user_items テーブル

| Column | Type       | Options                         |
| ------ | ---------- | ------------------------------- |
| user   | references | null: false, foreign_key: true  |
| item   | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one    :buy
- belongs_to :item