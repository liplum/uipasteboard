#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint uipasteboard.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'uipasteboard'
  s.version          = '0.1.0'
  s.summary          = 'A Flutter plugin to interact with UIPasteboard on iOS.'
  s.description      = <<-DESC
A Flutter plugin to interact with UIPasteboard on iOS.
                       DESC
  s.homepage         = 'http://github.com/liplum/uipasteboard'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Liplum' => 'Li_plum@outlook.com' }
  s.source           = { :path => '.' }
  s.source_files = 'uipasteboard/Sources/uipasteboard/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  # If your plugin requires a privacy manifest, for example if it uses any
  # required reason APIs, update the PrivacyInfo.xcprivacy file to describe your
  # plugin's privacy impact, and then uncomment this line. For more information,
  # see https://developer.apple.com/documentation/bundleresources/privacy_manifest_files
  # s.resource_bundles = {'uipasteboard_privacy' => ['uipasteboard/Sources/uipasteboard/PrivacyInfo.xcprivacy']}
end
