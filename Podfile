source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '9.0'

inhibit_all_warnings!
use_frameworks!

workspace 'changegamer'

target :changegamer do

  # Animation/Layout/UI
  pod 'pop'
  pod 'AsyncDisplayKit'
  pod 'BonMot'
  pod 'TTTAttributedLabel'

  # Core
  pod 'Parse'

  post_install do |installer|
      installer.pods_project.targets.each do |target|
          target.build_configurations.each do |config|
              config.build_settings['SWIFT_VERSION'] = '3.0'
          end
      end
  end

end
