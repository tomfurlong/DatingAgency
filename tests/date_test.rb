
require 'test/unit'
require_relative '../zin.rb'
require_relative '../aga.rb'
require_relative '../date.rb'

class DateTest < Test::Unit::TestCase
  def test_both_agree
    single1 = Aga.new('Kyle', 5, 5)
    single2 = Zin.new('Jo', 5, 5)
    single1.add_hobby(:art)
    single2.add_hobby(:art)
    date = Date.new(single1, single2)
    assert(date.match?(10))
  end

  def test_two_aga
    single1 = Aga.new('Jamie', 6, 7)
    single2 = Aga.new('Rory', 7, 6)
    single1.add_hobby(:art)
    single2.add_hobby(:art)
    date = Date.new(single1, single2)
    assert(date.match?(10))
  end

  def test_first_refuses
    single1 = Aga.new('Kyle', 5, 5)
    single2 = Zin.new('Jo', 5, 5)
    single1.add_hobby(:art)
    single2.add_hobby(:sport)
    date = Date.new(single1, single2)
    assert_false(date.match?(10))
  end

  def test_second_refuses
    single1 = Aga.new('Kyle', 5, 5)
    single2 = Zin.new('Jo', 5, 10)
    single1.add_hobby(:sport)
    single2.add_hobby(:sport)
    date = Date.new(single1, single2)
    assert_false(date.match?(10))
  end
end