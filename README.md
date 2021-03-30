# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| profile    | text   | null: false |

### Association

- has_many :homes
- has_many :comments

## items テーブル

| Column     | Type      | Options     |
| ---------- | --------- | ----------- |
| title      | string    | null: false |
| concept    | text      | null: false |
| text       | text      | null: false |
| user       | reference |             |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| text      | text       | null: false |
| user      | references |             |
| item      | references |             |

### Association

- belongs_to :user
- belongs_to :item