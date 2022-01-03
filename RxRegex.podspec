#
# Be sure to run `pod lib lint RxRegex.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RxRegex'
  s.version          = '1.0.0'
  s.summary          = 'Regular expression with RxSwift'

  s.description      = 'Use regular expression with RxSwift'

  s.homepage         = 'https://github.com/baegteun/RxRegex'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'baegteun' => 'baegteun@gmail.com' }
  s.source           = { :git => 'https://github.com/baegteun/RxRegex.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  
  s.swift_version = '5.0'

  s.source_files = 'Sources/RxRegex/Classes/**/*'
  
  s.dependency 'RxSwift', '~> 6.2.0'

end
