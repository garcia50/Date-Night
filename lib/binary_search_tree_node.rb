  class Node
   attr_accessor :movie,
                 :score,
                 :left,
                 :right,
                 :depth 
              
  def initialize(score, movie)
    @score = score
    @movie = movie
    @left = nil
    @right = nil
    @depth = 0
  end
end
