require './lib/book'
require './lib/author'
require 'minitest/pride'
require 'minitest/autorun'
require 'pry'

class AuthorTest < Minitest::Test
  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte",
                                  last_name: "Bronte"})
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Author, @charlotte_bronte
    assert_equal "Charlotte Bronte", @charlotte_bronte.name
    assert_equal [], @charlotte_bronte.books
  end

  def test_write_class_adds_books_objects
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    assert_equal Book, jane_eyre.class
    assert_equal "Jane Eyre", jane_eyre.title
    villette = @charlotte_bronte.write("Villette", "1853")
    assert_equal [jane_eyre, villette], @charlotte_bronte.books
  end
end
