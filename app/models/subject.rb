class Subject < ApplicationRecord

  has_many :pages

  validates_presence_of :name

  scope :visible,   -> {where(:visible => true)}
  scope :invisible, -> {where(:visible => false)}
  scope :search, -> (str){
    where(["name LIKE ?", "%#{str}%"])
  }

  validate :example

  def example
    if position == 1
      errors.add(:position, "is not allowed")
    end
  end
end
