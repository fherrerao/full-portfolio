class Project < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :tech_1, presence: true
  validates :tech_2, presence: true  
end
