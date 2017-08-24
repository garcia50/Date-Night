require 'minitest'
require 'minitest/autorun'
require './lib/binary_search_tree_node'

class NodeTest < Minitest::Test
  def test_if_node_class_exist
    assert Node.new(1, "Avatar")
  end

  def test_the_score_instance_if_it_returns_the_movie
    node = Node.new(1, "Avatar")
    assert_equal 1, node.score
  end

  def test_the_movie_instance_if_it_returns_the_movie
    node = Node.new(1, "Avatar")
    assert_equal "Avatar", node.movie
  end
end