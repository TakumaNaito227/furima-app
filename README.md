# README












# DB設計


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_one :profile
- has_one :address
- has_one :credit_card
- has_many :items
- has_many :selling_items <!-- 販売中商品 -->
- has_many :bought_items <!-- 自分が買った商品 -->
- has_many :sold_items <!-- 売却済み商品 -->

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|firstname|string|null: false|
|lastname|string|null: false|
|firstname_kana|string|null: false|
|lastname_kana|string|null: false|
|birth_year|date|null: false|
|birth_month|date|null: false|
|birth_day|date|null: false|
|phone_number|string|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user


## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|firstname|string|null: false|
|lastname|string|null: false|
|firstname_kana|string|null: false|
|lastname_kana|string|null: false|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|apartment_name|string| |
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user



## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key:true|
|customer_id|integer|null: false|
|card_id|integer|null: false|
### Association
- belongs_to :user


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|detail|text|null: false|
|condition|string||null: false|
|price|integer|null: false|
|postage|string|null: false|
|ship_from|string|null: false|
|ship_date|string|null: false|
|condition|string|null:false|
|brand|string|
|category_id|integer|null: false, foreign_key: true|
|buyer_id|integer|foreign_key: true|
|seller_id|integer|foreign_key: true| 

### Association
- has_many :images
- belongs_to :category
- belongs_to :seller, class_name: "User", foreign_key: "seller_id"
- belongs_to :buyer, class_name: "User", foreign_key: "buyer_id", optional: true

- belongs_to_active_hash :prefecture
- belongs_to_active_hash :status
- belongs_to_active_hash :shipping
- belongs_to_active_hash :fee

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|img|string|null: false|
|item_id|integer|null: falsem foreign_key: true|
### Association
- belongs_to :item


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string| |
### Association
- has_many :items

