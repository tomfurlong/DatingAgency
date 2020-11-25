
require_relative 'single.rb'

class Aga < Single
  def gender
    :aga
  end

  def match?(other, avg_desirability_other_singles)
    super && num_of_common_hobbies(other) >= 1
  end
end
