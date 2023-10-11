  class Category < ActiveHash::Base
    self.data = [
      { id: 1, name: '---' },
      { id: 2, name: '手芸' },
      { id: 3, name: 'アート' },
      { id: 4, name: '料理' },
      { id: 5, name: 'その他' },
    ]

    include ActiveHash::Associations
    has_many :arts
    end