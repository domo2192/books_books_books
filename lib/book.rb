class Book
  attr_reader:title,
             :first_name,
             :last_name,
             :publication_date
  def initialize(data)
    @title = data[:title]
    @first_name = data[:author_first_name]
    @last_name = data[:author_last_name]
    @publication_date = data[:publication_date]

  end

  def author
    @first_name + " " + @last_name
  end

  def publication_year
    @publication_date.split("").last(4).join("")
  end
end
