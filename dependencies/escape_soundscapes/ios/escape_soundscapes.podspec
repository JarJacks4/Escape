Pod::Spec.new do |s|
  s.name             = 'escape_soundscapes'
  s.version          = '0.1.0'
  s.summary          = 'Escape Soundscapes native module (SwiftUI, iOS 17+), embedded in the Flutter app.'
  s.homepage         = 'https://escapeapp.ai'
  s.license          = { :type => 'Proprietary' }
  s.author           = { 'Escape' => 'dev@escapeapp.ai' }
  s.source           = { :path => '.' }
  s.platform         = :ios, '14.0'
  s.swift_version    = '5.0'
  s.dependency 'Flutter'
  s.source_files        = 'Classes/**/*.{swift,h,m}'
  s.public_header_files = 'Classes/ObjC/*.h'
  s.resource_bundles = {
    'EscapeSoundscapes' => [
      'Resources/Assets.xcassets',
      'Resources/Fonts/*.ttf',
      'Resources/*.json',
      'Resources/Samples/*',
      'Resources/Metal/*.metallib'
    ]
  }
  # Observation is an iOS 17-only Swift library: weak-link it so the app still launches on iOS 14-16.
  s.user_target_xcconfig = { 'OTHER_LDFLAGS' => '$(inherited) -weak-lswiftObservation' }
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }

  # Unit tests (LucilleClientTests). Not built with the app; a Podfile entry with
  # :testspecs => ['Tests'] (or `pod lib lint`) is needed to build and run them.
  s.test_spec 'Tests' do |t|
    t.source_files = 'Tests/**/*.swift'
  end
end
