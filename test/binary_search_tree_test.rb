require 'minitest'
require 'minitest/autorun'
require './lib/binary_search_tree'

class BinarySearchTreeTest < Minitest::Test

  def test_if_the_class_exist
    # skip
    assert BinarySearchTree.new
  end

  def test_if_the_insert_method_works
    #skip
    movie = BinarySearchTree.new
    assert_equal 0, movie.insert(85, "Jaws")
    assert_equal 1, movie.insert(45, "The Purge")
    assert_equal 1, movie.insert(100, "The Revenant")
    assert_equal 2, movie.insert(95, "Avatar")
  end

  def test_if_the_include_method_works
    #skip
    movie = BinarySearchTree.new
    movie.insert(85, "Jaws")
    assert movie.include?(85)
  end

  def test_if_the_depth_of_method_works
    #skip
    movie = BinarySearchTree.new
    movie.insert(85, "Jaws")
    assert_equal 0, movie.depth_of(85)
  end

  def test_if_the_max_method_works
    #skip
    movie = BinarySearchTree.new
    movie.insert(55, "Experimenter")
    movie.insert(66, "Jurassic Park")
    movie.insert(45, "The Purge")
    movie.insert(85, "Jaws")
    assert_equal ({"Jaws" => 85}), movie.max
  end

  def test_if_the_min_method_works
    #skip
    movie = BinarySearchTree.new
     movie.insert(55, "Experimenter")
    movie.insert(66, "Jurassic Park")
    movie.insert(45, "The Purge")
    movie.insert(20, "Jaws")

    assert_equal ({"Jaws" => 20}), movie.min
  end

  def test_if_the_sort_method_works
    movie = BinarySearchTree.new
    movie.insert(61, "Bill & Ted's Excellent Adventure")
    movie.insert(16, "Johnny English")
    movie.insert(92, "Sharknado 3")
    movie.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal [{"Johnny English"=>16},
                  {"Hannibal Buress: Animal Furnace"=>50},
                  {"Bill & Ted's Excellent Adventure"=>61},
                  {"Sharknado 3"=>92}] , movie.sort
  end

  def test_if_the_load_method_works
    movie = BinarySearchTree.new
    assert_equal 100, movie.load("movie_list.txt")
  end 

  def test_if_health_method_works
    movie = BinarySearchTree.new
    movie.insert(98, "Animals United")
    movie.insert(58, "Armageddon")
    movie.insert(36, "Bill & Ted's Bogus Journey")
    movie.insert(93, "Bill & Ted's Excellent Adventure")
    movie.insert(86, "Charlie's Angels")
    movie.insert(38, "Charlie's Country")
    movie.insert(69, "Collateral Damage")
    assert_equal [[36, 2, 28], [93, 3, 42]], movie.health(2)

  end
end
