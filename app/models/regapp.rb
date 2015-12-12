class Regapp < ActiveRecord::Base
  has_many :events, dependent: :destroy
  belongs_to :user

  self.per_page = 10
end
