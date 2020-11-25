
require 'test/unit'
require_relative '../zin.rb'
require_relative '../aga.rb'

class ZinTest < Test::Unit::TestCase
 
  def test_match_only_with_aga
    zin = Zin.new('Jamie', 5, 5)
    other = Zin.new('Jo', 10, 5)
    assert_false(zin.match?(other, 10))
  end

  def test_clear_match_with_aga
    zin = Zin.new('Jamie', 5, 5)
    other = Aga.new('Jo', 5, 5)
    assert(zin.match?(other, 10))
  end

  def test_clear_match_with_aga_no_common_hobbies
    zin = Zin.new('Jamie', 5, 5)
    zin.add_hobby(:art)
    other = Aga.new('Jo', 5, 5)
    other.add_hobby(:music)
    assert(zin.match?(other, 10))
  end

  def test_match_with_aga_one_common_hobby
    zin = Zin.new('Jamie', 5, 5)
    other = Aga.new('Jo', 4, 5)
    assert_false(zin.match?(other, 10)) # match fails
    zin.add_hobby(:art)  # add common hobby
    other.add_hobby(:art)
    assert(zin.match?(other, 0))  # match should succeed
  end

  def test_match_with_aga_two_common_hobbies
    zin = Zin.new('Jamie', 5, 5)
    other = Aga.new('Jo', 3, 5)
    assert_false(zin.match?(other, 10)) # match fails
    zin.add_hobby(:art)  # add common hobby
    other.add_hobby(:art)
    assert_false(zin.match?(other, 10)) # match still fails
    zin.add_hobby(:music)  # add another common hobby
    other.add_hobby(:music)
    assert(zin.match?(other, 0))  # match should succeed
  end

  def test_not_enough_shared_hobbies
    zin = Zin.new('Jo', 5, 7)
    aga = Aga.new('Kyle', 5, 5)
    aga.add_hobby(:sport)
    zin.add_hobby(:sport)
    assert_false(zin.match?(aga, 10))
  end

end