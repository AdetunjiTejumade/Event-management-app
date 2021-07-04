class Event < ApplicationRecord
  belongs_to :user

  validates :name, :description, :location, :start_date, :end_date, presence: true
end
