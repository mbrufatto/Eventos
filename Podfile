# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Events' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Events
  pod 'Kingfisher', '~> 5.0'

  target 'EventsTests' do
    inherit! :search_paths
    # Pods for testing
  end
  
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build.configurations.each do |config|
        config.build_settings['CLANG_ENABLE_CODE_COVERAGE'] = 'NO'
      end
    end
    
    installer.pods_project.build_configurations.each do |config|
      config.build_settings['CLANG_ENABLE_CODE_COVERAGE'] = 'NO'
  end

end
