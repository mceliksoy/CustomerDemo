class Category < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
