#!/usr/local/bin/ruby -w

require 'test/unit'

require 'range.rb'
require 'tuple.rb'

class TestRange < Test::Unit::TestCase
  def setup
    @a = [ "a", "b", "c", "d", "e" ]
  end

  def test_index

    assert_equal("cab",
		 @a[2] +  @a[0] + @a[1],
		 "Must access member when access in bounds operator")
    assert_equal(nil,
		 @a[6],
                 "Must return nil when access out of bounds")  

    assert_equal(["c", "d", "e"],
		 @a[2, 3],
		 "Must duplicate original index operator for start, length range")
    assert_equal(["b", "c", "d"],
		 @a[1..3],
		 "Must duplicate original index operator for Range")
    assert_equal(["e"],
		 @a[4..7],
		 "Must duplicate original index operator for Range which extends beyond bounds")
    assert_equal(nil,
		 @a[6..10],
		 "Must duplicate original index operator for Range which is out of bounds") 
    assert_equal(["c", "d", "e"],
		 @a[-3, 3],
		 "Must duplicate original index operator for start, end range with negative index")
  end

  def test_skip
    assert_equal([ "a", "c", "e" ],
		 @a[Range.new(0, 10, 2)],
		 "Skip Range should select every Nth item between start and end, within bounds")
    r = Range.new(0, 10, 2)
    assert_equal([ 0, 2, 4, 6, 8, 10 ],
		 r.to_a,
		 "Skip Range should contain every Nth item between start and end")
  end

  def test_multi_index
    assert_equal([ "a", "c", "e", "b", "d", "b", "e" ],
		 @a[Range.new(0, 4, 2), Range.new(1, 5, 2), 1, 4],
		 "More than one range must be allowed for index")

    assert_equal([ "d", "e", "b", "e" ],
		 @a[3..4, 1, 4],
		 "A mix of regular and range indices must be allowed")
  end

end

class TestTuple < Test::Unit::TestCase

  def test_something
    t = Tuple.new("something", 2, 3)

    assert_raises(TypeError,
		  "Tuple must raise exception if modification of member attempted") do
      t[0].gsub!(/e/, '')
    end

    assert_raises(TypeError,
		  "Tuple must raise exception if modification attempted") do
      t[0] = "something else"
    end

    assert_raises(TypeError,
		  "Tuple must raise exception on attempt to append data") do
      t[4] = "new data"
    end

    assert_raises(TypeError,
		  "Tuple must raise exception for << of new data") do
      t << "more new data"
    end
  end

end

