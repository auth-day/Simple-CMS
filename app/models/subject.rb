class Subject < ApplicationRecord

  has_many :pages

  scope :visible,   -> {where(:visible => true)}
  scope :invisible, -> {where(:visible => false)}
  scope :search, -> (str){
    where(["name LIKE ?", "%#{str}%"])
  }

end
