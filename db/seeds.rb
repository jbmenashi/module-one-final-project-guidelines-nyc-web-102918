reader1 = Reader.create(name: "Tom")
reader2 = Reader.create(name: "Jerry")
reader3 = Reader.create(name: "Alice")

article1 = Article.create(title: "Downfall of America")
article2 = Article.create(title: "The World is Ending")
article3 = Article.create(title: "Armageddon")


ra1 = ReaderArticle.create(reader: reader1, article: article1, is_read: true)
ra2 = ReaderArticle.create(reader: reader2, article: article1, is_read: false)
ra3 = ReaderArticle.create(reader: reader1, article: article2, is_read: false)
ra4 = ReaderArticle.create(reader: reader3, article: article1, is_read: true)
