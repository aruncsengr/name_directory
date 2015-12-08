class Person < ActiveRecord::Base
  validates_presence_of :name
  validates :age, presence: true, numericality: true, length: {maximum: 3}

  class << self
    def search(search_term=nil)
      where(['name LIKE ?', "%#{search_term}%"])
    end
  end
end
