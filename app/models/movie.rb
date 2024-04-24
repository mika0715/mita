class Movie < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :expense, numericality: { only_integer: true }
    validates :start_time
  end
  validates :theater_id, numericality: { other_than: 1 , message: "can't be blank" }

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :theater
end
