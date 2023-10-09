# README

## users
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name     | string | null: false, unique: true |
| email    | string | null: false, unique: true |
| password | string | null: false, unique: true |

### Association
- has_many :arts
- has_many :comments
- has_many :favorites


# arts
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| title          | string | |
| content        | text |  |
| category_id    | string | null: false |
| subcategory_id | string | null: false |


### Association
- belongs_to :users
- has_many :comments
- has_many :favorites

# comments
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| art     | references | null: false, foreign_key: true |
| comment | text | null: false |

### Association
- belongs_to :users
- belongs_to :arts


# favorites
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| art     | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :arts