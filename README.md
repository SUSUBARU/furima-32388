# テーブル設計

## users テーブル

| Column         | Type    | Options     |
| -------------  | ------  | ----------- |
| nickname       | string  | null: false |ニックネーム
| email          | string  | null: false |メールアドレス
| password       | string  | null: false |パスワード
| name           | string  | null: false |お名前(全角)
| name_reading   | string  | null: false |お名前カナ(全角)
| birthday       | integer | null: false |生年月日

### Association

- has_many :items
- has_one  :buy

## items テーブル

| Column              | Type       | Options                        |
| ------------------  | ---------- | ------------------------------ |
| image               | string     | null: false                    |出品画像 
| item_name           | string     | null: false                    |商品名
| explain             | text       | null: false                    |商品の説明
| category            | integer    | null: false                    |カテゴリー
| state               | integer    | null: false                    |商品の状態
| burden              | integer    | null: false                    |配送料の負担
| delivery_source     | integer    | null: false                    |発送元の地域
| delivery_date       | integer    | null: false                    |発送までの日数
| price               | integer    | null: false                    |販売価格
| user                | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one  :buy

# buys テーブル

| Column                    | Type        | Options                        |
| ------------------------- | ----------- | ------------------------------ |
| card_number               | integer     | null: false                    |カード情報
| expiration_date           | integer     | null: false                    |有効期限
| security_code             | integer     | null: false                    |セキュリティコード
| postal_code               | integer     | null: false                    |郵便番号
| prefecture                | integer     | null: false                    |都道府県
| city                      | string      |                                |市町村
| house_number              | string      |                                |番地
| building_name             | string      |                                |建物名
| phone_number              | integer     | null: false                    |電話番号
| user                      | references  | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item