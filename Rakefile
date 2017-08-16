task default: :test_ios

task :test_ios do
  ruby 'Tests/all_the_tests.rb', 'ios'
end

task :test_android do
  sh "open /Applications/Genymotion.app/Contents/MacOS/player.app/ --args --vm-name 'ee20bfff-4244-4cf8-a29d-697aa5810381'"
  sh 'sleep 30'
  ruby 'Tests/all_the_tests.rb', 'android'
end

task :test_android_parallel do
  puts "\n++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  puts "++++++++++++++++++ Running tests in Parallel ++++++++++++++++++"
  puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n\n"
  ParallelTests::CLI.new.run(["--type", "test"] + ["-n","5"] + Dir["Tests/all_the_testsls.rb"])
end
