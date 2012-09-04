class BbCodeTags < ActiveRecord::Base
  attr_accessible :description, :enable_symbol, :example, :name, :regexp, :replacement
  validates :name, presence: true 
  validates :enable_symbol, presence: true 
end
