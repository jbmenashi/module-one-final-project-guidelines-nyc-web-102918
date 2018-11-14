class Article < ActiveRecord::Base
  has_many :reader_articles
  has_many :readers, through: :reader_articles

end
