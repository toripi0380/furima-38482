# DB設計


## usersテーブル

|Column-----------|Type--------|Options---------|

|nickname----------|string-----|null: false-----|
|email-------------|string-----|null: false-----|
|encrypted_password|string-----|null: false-----|
|name--------------|string-----|null: false-----|
|last_name---------|string-----|null: false-----|
|first_name--------|string-----|null: false-----|
|last_name_kana----|string-----|null: false-----|
|first_name_kana---|string-----|null: false-----|
|birthday----------|date-------|null: false-----|


### Association

has_many :items
has_many :purchasers



## itemsテーブル

|Column-----------|Type--------|Options---------|

|product----------|string------|null: false-----|
|description------|string------|null: false-----|
|category---------|string------|null: false-----|
|product_condition|string------|null: false-----|
|shipping_charges-|string------|null: false-----|
|ships_from-------|string------|null: false-----|
|number of days---|date--------|null: false-----|
|user-------------|references  |null: false, foreign_key:true|

### Association
belongs_to :users

## purchasersテーブル

|Column-----------|Type--------|Options---------|

|user-------------|references--|null: false, foreign_key:true|
|item-------------|references--|null: false, foreign_key:true|

### Association
belongs_to :users
has_one :shipping_informations


## shipping_informationsテーブル

|Column-----------|Type--------|Options---------|

|postal code------|integer-----|null: false-----|
|prefecture_id----|string------|null: false-----|
|city-------------|text--------|null: false-----|
|block------------|text--------|null: false-----|
|building---------|text--------|null: false-----|
|phone number-----|integer-----|null: false-----|


### Association
has_one :purchasers

（ここに追記していく）
