require 'parallel_tests'

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
  # appium -p 4492 -bp 2252 -U 192.168.56.101:5555
  # appium -p 4491 -bp 2251 -U 192.168.56.102:5555
  ruby 'Tests/all_the_tests.rb', 'android1'
  ruby 'Tests/all_the_tests.rb', 'android2'
end
