class Dashboard < ApplicationRecord
  belongs_to :user

  scope :recent, -> { where('expire > :date', date: DateTime.now) }

  acts_as_votable

end

