class Subcategory < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '雑貨' },
    { id: 3, name: 'アクセサリー' },
    { id: 4, name: 'バッグ' },
    { id: 5, name: 'ぬいぐるみ' },
    { id: 6, name: '財布' },
    { id: 7, name: 'キーホルダー' },
    { id: 8, name: 'その他' },
  ]
  include ActiveHash::Associations
  has_many :arts
  end
