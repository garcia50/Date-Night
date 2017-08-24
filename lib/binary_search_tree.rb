require './lib/binary_search_tree_node'
require 'pry'

class BinarySearchTree
  attr_accessor :head

  def initialize
    @head = nil
  end

  #The insert method adds a new node with the passed-in data. 
  #Each node is comprised of a score and a movie title. It returns the depth of the new node in the tree.
  def insert(score, movie)
    current = Node.new(score, movie)
    if head == nil
      @head = current
      @head.depth
    else
      insert_node(@head, current)
    end
  end

  def insert_node(head, current, count = 0)
    count += 1
    if current.score < head.score
      insert_left_node(head, current, count)
    else
      insert_right_node(head, current, count)
    end
  end

  def insert_left_node(head, current, count)
    if head.left == nil
      head.left = current
      head.left.depth = count
    else    
      insert_node(head.left, current, count)
    end
  end

  def insert_right_node(head, current, count)
    if head.right == nil
      head.right = current
      head.right.depth = count
    else
      insert_node(head.right, current, count)
    end
  end

  #Verify/reject the presence of a score in the tree:
  def include?(score, current = @head)
    if current.score == score
      true
    elsif current.score < score && current.left != nil
      include?(score, current.left)
    elsif current.score > score && current.right != nil
      include?(score, current.right)
    else 
      false
    end
  end

  #Reports the depth of the tree where a score appears. Return nil if the score does not exist:
  def depth_of(score, current = @head, count = 0)
    if current.score == nil
        nil
    elsif current.score > score
       count += 1 
       depth_of(score, current.left, count)
    elsif
       current.score < score 
       count += 1
       depth_of(score, current.right, count)
    else
      count
    end
  end

  #Which movie has the highest score in the list? What is it’s score?
  def max(current = @head)
    if current.right != nil
        max(current.right)
    else 
      {current.movie => current.score}
    end
  end

  #Which movie has the lowest score in the list? What is it’s score?
  def min(current = @head)
    if current.left != nil
        min(current.left)
    else 
      {current.movie => current.score}
    end
  end

  #Return an array of all the movies and scores in sorted ascending order. Return them as an array of hashes.
  #Note: you’re not using Ruby’s Array#sort. You’re traversing the tree.
  def sort(current = @head, sorted_movies = [])
    sorted_movies << {current.movie => current.score} if current.left.nil?
    sort(current.left, sorted_movies) unless current.left.nil?
    sorted_movies << {current.movie => current.score}  unless sorted_movies.include?({current.movie => current.score})
    sort(current.right, sorted_movies) unless current.right.nil?
    sorted_movies
  end

  #
  def load(file)
    movies = File.open("lib/#{file}", 'r')
    movies_array = []
    movies.readlines.map do |line|
      movies_array << line.split(",")
    end
    format_file(movies_array)
  end

  def format_file(movies)
    count = 0
    movies.map do |movie|
      movie_score = movie[0].to_i
      if count == 0
        count += 1
        insert(movie_score, movie[1])
      elsif !include?(movie_score)
        count += 1
        insert(movie_score, movie[1])
      end
    end
    count
  end

  def health(depth)
    scores_of_the_movies = score_of_the_node(depth)
    count_of_child_nodes = scores_of_the_movies.map do |n|
      children_nodes(n)
    end
    child_nodes_percentage = count_of_child_nodes.map do |n|
      percentage_of_child_nodes(n)
    end
    scores_of_the_movies.zip(count_of_child_nodes, child_nodes_percentage)
  end

 def score_of_the_node(depth, current = @head, health = [])
    health << current.score if depth == current.depth
    score_of_the_node(depth, current.left, health) if current.left != nil
    score_of_the_node(depth, current.right, health) if current.right != nil
    health
  end

  def children_nodes(score, current = @head)
    if score == current.score
      amount_of_child_nodes(current)
    elsif score < current.score
      children_nodes(score, current.left)
    else
      children_nodes(score, current.right)
    end
  end

 def amount_of_child_nodes(current, count = [])
    count << {current.movie => current.score} if current.left.nil?
    amount_of_child_nodes(current.left, count) if current.left != nil
    count << {current.movie => current.score}  if !count.include?({current.movie => current.score})
    amount_of_child_nodes(current.right, count) if current.right != nil
    count.length
  end

  def percentage_of_child_nodes(child_nodes)
    percentage = ((child_nodes.to_f / sort.length ) * 100).floor
  end
end
