class LineItemDate < ApplicationRecord
  belongs_to :quote
  has_many :line_items

  validates :date, presence: true, uniqueness: { scope: :quote_id }

  scope :ordered, -> {order(date: :asc)}
end
