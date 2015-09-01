class FrequentlyAskedQuestion < ActiveRecord::Base

  has_many :service_frequently_asked_questions, dependent: :destroy
  has_many :services, through: :service_frequently_asked_questions

  scope :displayed, -> { where(display: true) }

  validates :question, presence: true, uniqueness: true
  validates :answer, presence: true
end
