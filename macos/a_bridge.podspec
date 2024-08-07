#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint a_bridge.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'a_bridge'
  s.version          = '0.0.1'
  s.summary          = 'The flutter plugin that which was born to empower appium flutter automation in iOS simulator'
  s.description      = <<-DESC
The flutter plugin that which was born to empower appium flutter automation in iOS simulator
                       DESC
  s.homepage         = ' https://github.com/sreejithkr/a_bridge.git'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Sreejith K R' => 'masked' }

  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
