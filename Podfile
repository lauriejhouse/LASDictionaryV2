# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'LASDictionaryV2' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

pod 'Firebase/Auth'
pod 'Firebase/Core'
pod 'Firebase/Database'
pod 'Firebase/Performance'
pod 'Firebase/Storage'
pod 'Instabug'
pod 'BonsaiController'

pod 'Firebase/ABTesting' 



  # Pods for LASDictionaryV2

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end
