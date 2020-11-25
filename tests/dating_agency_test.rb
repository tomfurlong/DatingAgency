
require 'test/unit'
require_relative '../dating_agency.rb'
require_relative '../aga.rb'
require_relative '../zin.rb'

class DatingAgencyTest < Test::Unit::TestCase
  def setup
    DatingAgency.send(:public, :avg_desirability_other_singles)
    @dating_agency =  DatingAgency.new
  end

  def teardown
    DatingAgency.send(:private, :avg_desirability_other_singles)
  end

  def test_avg_desirability_list_length_2
    ignore_single1 = Zin.new('john', 10, 10)
    ignore_single2 = Zin.new('mike', 10, 10)
    @dating_agency.add_single(ignore_single1)
    @dating_agency.add_single(ignore_single2)
    avg_desirability = @dating_agency.avg_desirability_other_singles(ignore_single1, ignore_single2)
    assert_equal(0, avg_desirability)
  end

  def test_avg_desirability_list_length_3
    ignore_single1 = Zin.new('john', 10, 10)
    ignore_single2 = Zin.new('mike', 10, 10)
    single3 = Zin.new('anne', 5, 5)
    @dating_agency.add_single(ignore_single1)
    @dating_agency.add_single(ignore_single2)
    @dating_agency.add_single(single3)
    avg_desirability = @dating_agency.avg_desirability_other_singles(ignore_single1, ignore_single2)
    assert_equal(5, avg_desirability)
  end

  def test_avg_desirability_list_length_5
    ignore_single1 = Zin.new('john', 10, 10)
    ignore_single2 = Zin.new('mike', 10, 10)
    single3 = Zin.new('anne', 6, 5)
    single4 = Zin.new('luke', 7, 5)
    @dating_agency.add_single(ignore_single1)
    @dating_agency.add_single(ignore_single2)
    @dating_agency.add_single(single3)
    @dating_agency.add_single(single4)
    avg_desirability = @dating_agency.avg_desirability_other_singles(ignore_single1, ignore_single2)
    assert_equal(6.5, avg_desirability)
  end

  def test_avg_desirability_list_length_10
    @dating_agency.add_single(Zin.new('anne', 6, 5))
    ignore_single1 = Zin.new('john', 10, 10)
    @dating_agency.add_single(ignore_single1)
    @dating_agency.add_single(Zin.new('q', 5, 5))
    @dating_agency.add_single(Zin.new('w', 10, 5))
    @dating_agency.add_single(Zin.new('e', 1, 5))
    @dating_agency.add_single(Zin.new('r', 4, 5))
    @dating_agency.add_single(Zin.new('t', 6, 5))
    @dating_agency.add_single(Zin.new('y', 8, 5))
    ignore_single2 = Zin.new('mike', 10, 10)
    @dating_agency.add_single(ignore_single2)
    @dating_agency.add_single(Zin.new('luke', 7, 5))
    avg_desirability = @dating_agency.avg_desirability_other_singles(ignore_single1, ignore_single2)
    assert_equal(5.875, avg_desirability)
  end

  def test_match
    @dating_agency.add_single(Aga.new('q', 5, 6).add_hobby(:sport))
    @dating_agency.add_single(Zin.new('w', 6, 7))
    @dating_agency.add_single(Aga.new('e', 8, 9).add_hobby(:art))
    @dating_agency.add_single(Zin.new('r', 9, 7).add_hobby(:art))
    @dating_agency.add_single(Aga.new('t', 6, 6))
    @dating_agency.add_single(Zin.new('y', 6, 5).add_hobby(:sport))
    @dating_agency.match
    assert_equal("Couples:\n(q, y)\n(e, r)\nSingles:\nw\nt\n", @dating_agency.to_s)
  end

  def test_sort_on_fussiness
    @dating_agency.add_single(Aga.new('q', 1, 10))
    @dating_agency.add_single(Zin.new('w', 6, 7))
    @dating_agency.add_single(Aga.new('e', 8, 9))
    @dating_agency.add_single(Zin.new('a', 7, 8))
    @dating_agency.add_single(Aga.new('t', 6, 6))
    @dating_agency.add_single(Zin.new('y', 10, 1))
    @dating_agency.sort_on_fussiness
    DatingAgency.send(:attr_reader, :singles)
    names_in_fussiness_order = []
    @dating_agency.singles.each{|single| names_in_fussiness_order << single.name}
    assert_equal(%w(y t a e w q), names_in_fussiness_order)
  end
end