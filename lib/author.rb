require './lib/book'
class Author
  attr_reader:books, :first_name, :last_name
  def initialize(details)
    @first_name = details[:first_name]
    @last_name = details[:last_name]
    @books = []
  end

  def name
    @first_name + " " + @last_name
  end

  def write(title, publication_date)
    book = Book.new({
                    author_first_name: @first_name,
                    author_last_name: @last_name,
                    title: title,
                    publication_date:publication_date
      })
      @books << book
      book
  end
end
