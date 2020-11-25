
require_relative 'single.rb'
require_relative 'aga.rb'
require_relative 'zin.rb'
require_relative 'dating_agency.rb'

dating_agency = DatingAgency.new

IO.foreach('singles.txt') do |line|
  data = line.split
  gender_letter = data[0]
  name = data[1]
  desirability = data[2].to_i
  sought_desirability = data[3].to_i
  hobbies = []
  4.upto(data.length-1) do |i|
    hobbies << data[i].to_sym
  end
  if gender_letter == 'a'
    single = Aga.new(name, desirability, sought_desirability)
  elsif gender_letter == 'z'
    single = Zin.new(name, desirability, sought_desirability)
  else
    abort 'Error in input file'
  end
  hobbies.each { |hobby| single.add_hobby(hobby)}
  dating_agency.add_single(single)
end

dating_agency.sort_on_fussiness
dating_agency.match
puts dating_agency.to_s