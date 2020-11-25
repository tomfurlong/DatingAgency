
class Single
  attr_reader :name, :desirability

  def initialize(name, desirability, sought_desirability)
    @name, @desirability, @sought_desirability = name, desirability, sought_desirability
    @hobbies =  []
  end

  def match?(other, avg_desirability_other_singles)
    perceived_desirability(other) >= @sought_desirability || perceived_desirability(other) > avg_desirability_other_singles
  end

  def add_hobby(hobby)
    @hobbies << hobby if !has_hobby(hobby)
    self
  end

  def has_hobby(hobby)
    @hobbies.include?(hobby)
  end

  def fussiness
    @sought_desirability - @desirability
  end

  def to_s
    "#{@name}, #{gender.to_s}, #{@desirability}, #{@sought_desirability}, #{fussiness}, #{@hobbies}"
  end

  private

  def perceived_desirability(other)
    other.desirability
  end
  
  def num_of_common_hobbies(other)
    @hobbies.count { |hobby| other.has_hobby(hobby) }
  end
end