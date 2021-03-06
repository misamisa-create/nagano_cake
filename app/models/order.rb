class Order < ApplicationRecord

  enum payment_method: { クレジットカード: 0, 銀行振込: 1 }
  enum status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }

  belongs_to :customer
  has_many :order_details, dependent: :destroy

  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true


  def set_date
    created_at.strftime("%Y年%m月%d日%H時%M分")
  end



end
