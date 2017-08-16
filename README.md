# appium-training
appium_training


gem install bundle - install bundler

gem install rake - install rake

rake test_ios - launch ios tests

rake test_android - launch android tests

For parallel executing:

1. Start first appium server instance (appium -p 4492 -bp 2252 -U {First Device UDID})
2. Start the second appium server instance (appium -p 4491 -bp 2251 -U {Second Device UDID})
3. Make sure that udid is correspond to your devices set,  app fields from caps are located to your app.
4. From Project folder type "rake test_android_parallel"