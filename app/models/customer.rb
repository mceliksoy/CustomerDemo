class Customer < ActiveRecord::Base
  belongs_to  :country
  belongs_to  :category
  # has_many    :customers_notes, :dependent => :destroy
  
  validates :company_name, :presence => true
  
  def self.search(search)
    if search
      where('company_name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end  
end
