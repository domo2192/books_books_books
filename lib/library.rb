require'./lib/book'
class Library
  attr_reader :name,
              :authors,
              :books,
              :checked_out_books
  def initialize(name)
    @name = name
    @authors = []
    @books = []
    @checked_out_books = []
    @popularity = Hash.new(0)
  end

  def add_author(author)
    @authors << author
    author.books.map do |book|
      @books << book
    end
  end

  def publication_time_frame_for(author)
    oldest_book = author.books.min_by do |book|
      book.publication_year.to_i
    end


  newest_book = author.books.max_by do |book|
    book.publication_year.to_i
    end
    {
    start: oldest_book.publication_year,
  end: newest_book.publication_year}
  end

  def checkout(book)
    if @books.include?(book) && !@checked_out_books.include?(book)
      @checked_out_books << book
      @popularity[book] += 1
      true
    else
      false
    end
  end

  def return(book)
    @checked_out_books.delete(book)
  end

  def most_popular_book
    @popularity.max_by do |book, times_checked_out|
      times_checked_out
    end.first
  end
end
