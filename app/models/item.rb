class Item < ApplicationRecord
  enum status: {"---": 0, "新品・未使用": 1, "未使用に近い": 2,"目立った傷や汚れなし":3,"やや傷や汚れあり":4,"傷や汚れあり":5,"全体的に状態が悪い":6}
  enum prefecture: {"--":0,"北海道":1,"青森県":2,"岩手県":3,"宮城県":4,"秋田県":5,"山形県":6,"福島県":7,"茨城県":8,"栃木県":9,"群馬県":10,"埼玉県":11,"千葉県":12,"東京都":13,"神奈川県":14,"新潟県":15,
                    "富山県":16,"石川県":17,"福井県":18,"山梨県":19,"長野県":20,"岐阜県":21,"静岡県":22,"愛知県":23,"三重県":24,"滋賀県":25,"京都府":26,"大阪府":27,"兵庫県":28,"奈良県":29,"和歌山県":30,
                    "鳥取県":31,"島根県":32,"岡山県":33,"広島県":34,"山口県":35,"徳島県":36,"香川県":37,"愛媛県":38,"高知県":39,"福岡県":40,"佐賀県":41,"長崎県":42,"熊本県":43,"大分県":44,"宮崎県":45,"鹿児島県":46,"沖縄県":47,"未定":48}
  enum category_l: {"----":0,"レディース":1,"メンズ":2,"ベビー・キッズ":3,"コスメ・香水・美容":4,"インテリア・住まい・小物":5,"本・音楽・ゲーム":6,"おもちゃ・ホビー・グッズ":7,"家電・スマホ・カメラ":8,"スポーツ・レジャー":9,"ハンドメイド":10,"チケット":11,"自動車・オートバイ":12,"その他":13}
  enum sales_status: {"出品中":1,"公開停止":2,"取引中":3,"売却済み":4}
  
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :status, presence: true
  validates :delivery_days, presence: true
  validates :delivery_charge, presence: true
  validates :category_l, presence: true
  validates :prefecture, presence: true
  validates :price,numericality: { only_integer: true,greater_than: 299, less_than: 10000000}
  validates :image, presence: true
  # has_many :images
  # belongs_to :user, foreign_key:"seller_id"
  belongs_to :seller, class_name:"User"
  # belongs_to :wallet
  has_one :buyer, class_name:"User"
  # accepts_nested_attributes_for :images
  mount_uploader :image, ImageUploader
  scope :recent, -> {order('id DESC').limit(4)}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :children
  belongs_to_active_hash :grandchildren
end
