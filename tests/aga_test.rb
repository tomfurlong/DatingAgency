
require 'test/unit'
require_relative '../zin.rb'
require_relative '../aga.rb'

class AgaTest < Test::Unit::TestCase
  def test_common_hobby_essential
    aga = Aga.new('Jamie', 10, 5)
    other = Zin.new('Jo', 10, 5)
    aga.add_hobby(:art)
    other.add_hobby(:sport)
    other.add_hobby(:music)
    assert_false(aga.match?(other, 10))
  end

  def test_clear_match_with_zin
    aga = Aga.new('Jamie', 5, 5)
    other = Zin.new('Jo', 5, 5)
    aga.add_hobby(:art)
    other.add_hobby(:art)
    assert(aga.match?(other, 10))
  end

  def test_clear_match_with_aga
    aga = Aga.new('Jamie', 5, 5)
    other = Aga.new('Jo', 5, 5)
    aga.add_hobby(:sport)
    other.add_hobby(:sport)
    assert(aga.match?(other, 10))
  end
end