# DB設計

## userテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|

## groupテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

## commentテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|image|text||

### Association
- belongs_to :group
- belongs_to :user

## groups_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## comments_groups_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
|comment_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user
- belongs_to :comment