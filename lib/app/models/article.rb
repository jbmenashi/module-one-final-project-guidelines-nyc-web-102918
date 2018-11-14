class Article < ActiveRecord::Base
  has_many :reader_articles
  has_many :readers, through: :reader_articles







# #for each article in article hash
# #title = article[title]
#   def pub_date
#
#   end
#
#
#   def url
#
#   end

end
