
require 'test/unit'
require_relative '../single.rb'

class Single_Test < Test::Unit::TestCase
  def setup
    Single.send(:public, :num_of_common_hobbies)
  end

  def teardown
    Single.send(:private, :num_of_common_hobbies)
  end

  def test_new_single_has_no_hobbies
    single =  Single.new('John', 5, 5)
    assert_false(single.has_hobby(:art) || single.has_hobby(:music) || single.has_hobby(:sport))
  end

  def test_add_hobby
    single =  Single.new('John', 5, 5)
    single.add_hobby(:art)
    assert_false(single.has_hobby(:music) || single.has_hobby(:sport))
    assert_true(single.has_hobby(:art))
    single.add_hobby(:sport)
    assert_false(single.has_hobby(:music))
    assert_true(single.has_hobby(:sport))
  end

  def test_num_of_common_hobbies
    single1 =  Single.new('John', 5, 5)
    single2 =  Single.new('Aoife', 5, 5)
    assert_equal(0, single1.num_of_common_hobbies(single2))
    single1.add_hobby(:art)
    single2.add_hobby(:art)
    assert_equal(1, single1.num_of_common_hobbies(single2))
    single1.add_hobby(:sport)
    single2.add_hobby(:sport)
    single1.add_hobby(:music)
    assert_equal(2, single1.num_of_common_hobbies(single2))
  end

  def test_match_clearly_true
    single1 =  Single.new('John', 1, 5)
    single2 =  Single.new('Aoife', 5, 10)
    assert(single1.match?(single2, 10))
  end

  def test_match_avg_desirability_less_than_other
    single1 =  Single.new('John', 1, 5)
    single2 =  Single.new('Aoife', 3, 10)
    assert(single1.match?(single2, 2))
  end

  def test_match_avg_desirability_more_than_other
    single1 =  Single.new('John', 1, 5)
    single2 =  Single.new('Aoife', 3, 10)
    assert_false(single1.match?(single2, 4))
    end 

  def test_match_avg_desirability_equal_to_other
    single1 =  Single.new('John', 1, 5)
    single2 =  Single.new('Aoife', 3, 10)
    assert_false(single1.match?(single2, 4))
  end

end