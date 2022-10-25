# DB設計


## usersテーブル

|Column     |Type     |Options     |

|nickname          |string     |null: false     |
|email             |string     |unique: true    |
|encrypted_password|string     |null: false     |
|last_name         |string     |null: false     |
|first_name        |string     |null: false     |
|last_name_kana    |string     |null: false     |
|first_name_kana   |string     |null: false     |
|birthday          |date       |null: false     |


### Association

* has_many :items
* has_many :purchasers



## itemsテーブル

|Column     -|Type     ---|Options     ----|

|product          |string       |null: false     |
|description      |text         |null: false     |
|category_id      |integer      |null: false     |
|product_condition_id|integer     |null: false     |
|shipping_charges_id |integer     |null: false     |
|ships_from_id       |integer     |null: false     |
|number_of_days_id   |integer       |null: false     |
|price               |integer      |null: false    |
|user              |references  |null: false, foreign_key:true|

### Association
* belongs_to :user
* has_one :purchaser

## purchasersテーブル

|Column     |Type     |Options     |

|user        |references--|null: false, foreign_key:true|
|item        |references--|null: false, foreign_key:true|

### Association
* belongs_to :user
* has_one :shipping_information
* belongs_to :item

## shipping_informationsテーブル

|Column     |Type     |Options     |

|postal_code      |string     |null: false     |
|prefecture_id    |integer     |null: false     |
|city            |string        |null: false     |
|block            |string        |null: false     |
|building         |string       |                |
|phone_number     |string     |null: false     |
|purchaser     |references  |null: false, foreign_key:true|

### Association
* belongs_to :purchaser

（ここに追記していく）
