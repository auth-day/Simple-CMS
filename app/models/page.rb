class Page < ApplicationRecord

  belongs_to :subject
  has_and_belongs_to_many :editors, :class_name => "AdminUser"

  validates_presence_of :name
  validates_length_of   :name, :maximum => 25
  validates_uniqueness_of :permalink

end
