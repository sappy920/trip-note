class Category < ActiveHash::Base
  self.data = [
    {id: 0, name: '---' },
    {id: 1, name: 'レストラン'}, 
    {id: 2, name: 'ホテル'}, 
    {id: 3, name: '観光'},
    {id: 4, name: 'カフェ'},
    {id: 5, name: 'その他'},
  ]
    include ActiveHash::Associations
    has_many :articleｓ
end