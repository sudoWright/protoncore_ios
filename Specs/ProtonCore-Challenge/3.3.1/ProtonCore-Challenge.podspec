require_relative 'pods_configuration'

Pod::Spec.new do |s|
    
    s.name             = 'ProtonCore-Challenge'
    s.version          = $version
    s.summary          = 'shared frameworks'
    
    s.description      = <<-DESC
    ios shared frameworks for all client apps
    DESC
    
    s.homepage         = $homepage
    s.license          = $license
    s.author           = $author
    s.source           = $source
    
    s.ios.deployment_target = $ios_deployment_target
    
    s.swift_versions = $swift_versions

    this_pod_does_not_have_subspecs(s)

    s.dependency 'ProtonCore-Foundations', $version

    s.source_files = 'libraries/Challenge/Sources/**/*.{h,m,swift}'

    s.test_spec 'Tests' do |challenge_tests|
        challenge_tests.source_files = 'libraries/Challenge/Tests/**/*.swift'
    end

    s.framework = 'UIKit'
    s.pod_target_xcconfig = { 'APPLICATION_EXTENSION_API_ONLY' => 'NO' }
    
end
