require './lib/author'
require './lib/library'
require 'minitest/pride'
require 'minitest/autorun'
require 'pry'

class LibraryTest < MiniTest::Test
  def setup
    @dpl = Library.new("Denver Public Library")
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Library, @dpl
    assert_equal "Denver Public Library", @dpl.name
    assert_equal [], @dpl.books
    assert_equal [], @dpl.authors
  end

  def test_it_can_add_authors_and_books
    charlotte_bronte = Author.new({first_name: "Charlotte",
                                  last_name: "Bronte"})
    villette = charlotte_bronte.write("Villette", "1853")
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    charlotte_bronte.write("Villette", "1853")

    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    @dpl.add_author(charlotte_bronte)
    @dpl.add_author(harper_lee)
      assert_equal [jane_eyre, villette], charlotte_bronte.books
    end

    def test_publication_time_frame_for
      charlotte_bronte = Author.new({first_name: "Charlotte",
                                    last_name: "Bronte"})
      villette = charlotte_bronte.write("Villette", "1853")
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      professor = charlotte_bronte.write("The Professor", "1857")
      professor = charlotte_bronte.write("Villette", "1853")

      harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")


      result_1 = {:start=>"1847", :end=>"1857"}
      assert_equal result_1, @dpl.publication_time_frame_for(charlotte_bronte)

      result_2 = {:start=>"1960", :end=>"1960"}
      assert_equal result_2 , @dpl.publication_time_frame_for(harper_lee)
    end

    def test_books_can_be_checked_out
      charlotte_bronte = Author.new({first_name: "Charlotte",
                                    last_name: "Bronte"})
      villette = charlotte_bronte.write("Villette", "1853")
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      professor = charlotte_bronte.write("The Professor", "1857")
      professor = charlotte_bronte.write("Villette", "1853")

      harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

      assert_equal false, @dpl.checkout(mockingbird)
      assert_equal false, @dpl.checkout(jane_eyre)
      @dpl.add_author(charlotte_bronte)
      @dpl.add_author(harper_lee)
      assert_equal true, @dpl.checkout(jane_eyre)
      assert_equal [jane_eyre], @dpl.checked_out_books

      assert_equal false, @dpl.checkout(jane_eyre)
    end

    def test_return_book
      charlotte_bronte = Author.new({first_name: "Charlotte",
                                    last_name: "Bronte"})
      villette = charlotte_bronte.write("Villette", "1853")
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      professor = charlotte_bronte.write("The Professor", "1857")
      professor = charlotte_bronte.write("Villette", "1853")

      harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
      @dpl.add_author(charlotte_bronte)
      @dpl.add_author(harper_lee)
      @dpl.checkout(jane_eyre)
      @dpl.return(jane_eyre)
      assert_equal [], @dpl.checked_out_books
    end
    def test_popularity
    charlotte_bronte = Author.new({first_name: "Charlotte",
                                  last_name: "Bronte"})
    villette = charlotte_bronte.write("Villette", "1853")
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    professor = charlotte_bronte.write("Villette", "1853")

    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    @dpl.add_author(charlotte_bronte)
    @dpl.add_author(harper_lee)
    @dpl.checkout(jane_eyre)
    @dpl.return(jane_eyre)
    @dpl.checkout(jane_eyre)
    @dpl.checkout(mockingbird)
    assert_equal jane_eyre, @dpl.most_popular_book
  end
end
