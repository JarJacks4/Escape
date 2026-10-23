#
# Escape Health — HealthKit bridge (local plugin, not published).
#
Pod::Spec.new do |s|
  s.name             = 'escape_health'
  s.version          = '0.1.0'
  s.summary          = 'Apple Health (HealthKit) bridge for Escape.'
  s.description      = 'Reads heart rate, resting heart rate, HRV, sleep and steps; writes State of Mind (iOS 18+) and mindful minutes.'
  s.homepage         = 'https://escape.com'
  s.license          = { :type => 'Proprietary', :text => 'Copyright Escape LLC. All rights reserved.' }
  s.author           = { 'Escape' => 'support@escape.com' }
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform         = :ios, '14.0'
  s.frameworks       = 'HealthKit'
  s.swift_version    = '5.0'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
end
