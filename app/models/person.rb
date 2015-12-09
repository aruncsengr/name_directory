class Person < ActiveRecord::Base
  include Searchable

  validates_presence_of :name
  validates :age, presence: true, numericality: true, length: {maximum: 3}
end
