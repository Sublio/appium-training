task default: %w[test_ios]

task :test_ios do
	bundle exec ruby 'all_the_tests.rb', 'ios'
end

task :test_android do
	sh "open /Applications/Genymotion.app/Contents/MacOS/player.app/ --args --vm-name 'ee20bfff-4244-4cf8-a29d-697aa5810381'"
  sh "sleep 30"
	bundle exec ruby 'all_the_tests.rb', 'android'
end
