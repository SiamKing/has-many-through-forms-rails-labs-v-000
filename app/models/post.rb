class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories, autosave: true
  has_many :comments
  has_many :users, through: :comments
  
  def categories_attributes=(category_attributes)
    category_attributes.values.each do |cat_attribute|
      category = Category.find_or_create_by(cat_attribute)
      self.categories << category
    end
  end

  def unique_users
    self.users.uniq
  end
  
end
