# ChatSpace
- - -

## Overview
ログイン, グループ作成, 文字の投稿, 画像の投稿, アカウント作成, アカウント編集, ログアウト
- - -

## Database Design
- - -
### messages table
#### column
```
t.text       :body, null: false  
t.string     :image  
t.references :user, foreign_key: true  
t.references :group, foreign_key: true  
t.timestamps  
```

#### association
```
belongs_to :user  
belongs_to :group  
```
- - -

### users table
#### column
```
t.string :nickname, null:false  
t.string :mail, null:false  
t.string :password, null:false  
```
#### association
```
has_many :messages  
has_many :user_groups  
has_many :groups, :through => :user_groups  
```
- - -

### groups table
#### column
```
t.string :group_name  
```
#### association
```
has_many :messages  
has_many :user_groups  
has_many :users, :through => :user_groups  
```
- - -

### user_groups table
#### column
```
t.references :user, index: true, foreign_key: true  
t.references :group, index: true, foreign_key: true  
t.timestamps
```
#### association
```
belongs_to :user  
belongs_to :group  
```
- - -


