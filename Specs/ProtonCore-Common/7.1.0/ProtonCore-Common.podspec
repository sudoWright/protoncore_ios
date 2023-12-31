require_relative 'pods_configuration'

Pod::Spec.new do |s|

    s.name             = 'ProtonCore-Common'
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
    s.osx.deployment_target = $macos_deployment_target

    s.swift_versions = $swift_versions

    s.pod_target_xcconfig = { 'APPLICATION_EXTENSION_API_ONLY' => 'YES' }

    s.dependency 'ProtonCore-UIFoundations', $version
    s.dependency "ProtonCore-Services", $version
    s.dependency "ProtonCore-Networking", $version

    this_pod_does_not_have_subspecs(s)

    s.ios.source_files = 'libraries/Common/Sources/iOS/*', 'libraries/Common/Sources/Shared/*'
    s.osx.source_files = 'libraries/Common/Sources/Shared/*'
    s.test_spec 'Tests' do |test_spec|
        test_spec.source_files = 'libraries/Common/Tests/**/*.swift'
    end

end
