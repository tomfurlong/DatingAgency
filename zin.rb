
require_relative 'single.rb'

class Zin < Single
  def gender
    :zin
  end

  def match?(other, avg_desirability_other_singles)
    return false if other.gender != :aga
    super
  end

  private

  def perceived_desirability(other)
    super + num_of_common_hobbies(other)
  end
end