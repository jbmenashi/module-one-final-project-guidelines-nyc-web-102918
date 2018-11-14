class Reader < ActiveRecord::Base
  has_many :reader_articles
  has_many :articles, through: :reader_articles

end
