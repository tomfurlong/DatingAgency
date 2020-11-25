
test_files = Dir['*.rb']
this_file = File.basename(__FILE__)

test_files.each do |test_file|
  require_relative test_file if test_file != this_file
end
